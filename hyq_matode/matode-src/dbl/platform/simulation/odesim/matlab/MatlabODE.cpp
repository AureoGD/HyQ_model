/*
 *    Copyright (C) 2012 Wouter Caarls (DBL)
 *
 *    This program is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU Lesser General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU Lesser General Public License for more details.
 *
 *    You should have received a copy of the GNU Lesser General Public License
 *    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <QtGui>
#include <mex.h>

#include <PosixNonRealTimeThread.hpp>
#include <STGListener.h>
#include <XMLConfiguration.h>
#include <Stopwatch.hpp>

#include "MatlabODE.h"
#include "Dialog.h"
#include "Simulator.h"

class MatlabODE: public MainLog, private PosixNonRealTimeThread, public CSTGListener<GenericState>
{
  protected:
    Simulator mSim;
    Dialog *mDialog;
    QApplication *mApp;
    bool mShowDialog, mInitialized, mSimInitialized;
    int mMaxStateIdx, mMaxActionIdx;
    uint64_t mStateID;
    double mStepTime;
    int mSubsamplingFactor;
    bool mRealtime;
	bool mSpinning;
	double mNextStepTime;

  public:
    MatlabODE(bool showDialog=true)
      : PosixNonRealTimeThread("MatlabODE-thread", BaseThread::NORMAL),
        CSTGListener<GenericState>(&mSim),
        mSim(),
        mDialog(NULL), mApp(NULL), mShowDialog(showDialog),
        mInitialized(false), mSimInitialized(false),
        mStateID(0), mSpinning(false),
		mNextStepTime(0)
    {
      start();
    }

    ~MatlabODE()
    {
      mSim.stop();
      if (mSimInitialized)
        mSim.deinit();

      if (mApp)
        mApp->exit();

	  stop();
      stopListening();
      awaitTermination();
    }

    void run()
    {
      int argc=1;
      char *argv[] = {(char*)"matlab"};

      startListening(stgReceiveAll, 1, 10, "-MatlabODE");

      if (mShowDialog)
      {
        mLogNoticeLn("Initializing Qt");
        mApp = new QApplication(argc, argv);

        mDialog = new Dialog(&mSim);
		mDialog->show();

        mLogNoticeLn("Spinning");
		mSpinning = true;
        mApp->exec();
		mSpinning = false;

        mLogNoticeLn("Shutting down visualization");
        if(mSim.isInitialized())
        	mLogNoticeLn("Simulation loop is still running! Please wait for it to finish or press Ctrl-C to abort...");

        if (mDialog)
		{
          delete mDialog;
		  mDialog = NULL;
		}
        delete mApp;
		mApp = NULL;
      }
      else
      {
        mLogNoticeLn("Spinning");
		mSpinning = true;
        while (!shouldStop()) usleep(10000);
		mSpinning = false;
      }
    }

    bool init(std::string xmlFilename)
    {
      mInitialized = false;

	  // Make sure Qt is initialized
      while (!mSpinning && running()) usleep(10000);
	  if (!running()) return false;

      mMaxStateIdx = mMaxActionIdx = 0;
      mSim.stop();

      mLogNoticeLn("Reading configuration from " << xmlFilename);

      CXMLConfiguration xmlConfig;
      if (!xmlConfig.loadFile(xmlFilename))
      {
        mLogErrorLn("Couldn't load XML configuration file \"" << xmlFilename << "\"!\nPlease check that the file exists and that it is sound (error: " << xmlConfig.errorStr() << ").");
        return false;
      }
      else
      {
        // Resolve expressions
        int numResolvedExpressions = xmlConfig.resolveExpressions();

        std::string loglevel;
        xmlConfig.root().get("loglevel", &loglevel, "info");
        gLogFactory().setLevel(gLogFactory().getLevelFromString(loglevel));

        // Check version
        double version;
        xmlConfig.root().get("version", &version, -1);
        if (version < REQUIRED_CONFIG_VERSION)
        {
          mLogErrorLn("XML configuration file has version " << version << " but version " << REQUIRED_CONFIG_VERSION << " required!");

          return false;
        }
        else
        {
          mLogNoticeLn("XML configuration file \"" << xmlFilename << "\" successfully read. Resolved " << numResolvedExpressions << " expressions.");

          if (version > REQUIRED_CONFIG_VERSION)
            mLogWarningLn("Version (" << version << ") larger than required (" << REQUIRED_CONFIG_VERSION << ")!");
        }
      }

      // Feed xml config to sim
      if (!mSim.readConfig(xmlConfig.root().section("ode")))
      {
        mLogErrorLn("Loading XML configuration failed!");
        return false;
      }

      mStepTime = mSim.getSim()->getStepTime();
      mSubsamplingFactor = 1;
      mRealtime = false;

      // Init sim
      if (!mSim.init())
      {
        mLogErrorLn("Could not init simulation!");
        return false;
      }
      else
      {
        mSimInitialized = true;
        if (mSim.start())
        {
          mLogInfoLn("Simulation started");
        }
        else
        {
          mSim.deinit();
          mLogErrorLn("Could not start simulation!");
          return false;
        }
      }

      mInitialized = true;
      return true;
    }

    void setInitialCondition(rg_uint32 seed)
    {
      mSim.setInitialCondition(seed);
    }
    int getStateIndex(char *name)
    {
      int s = mSim.getStateIndex(name);
      if (s > mMaxStateIdx) mMaxStateIdx = s;
      return s;
    }
    int getActionIndex(char *name)
    {
      int a = mSim.getActionIndex(name);
      if (a > mMaxActionIdx) mMaxActionIdx = a;
      return a;
    }
    int getStateSize()
    {
      return mMaxStateIdx+1;
    }
    int getActionSize()
    {
      return mMaxActionIdx+1;
    }
    bool readState(double *state)
    {
      for (int ii=0; ii != mSubsamplingFactor; ii++)
      {
        if (mRealtime)
		{
			double desiredStepTime = (mStepTime*1000000/mSubsamplingFactor);
			double sleepTime = (mNextStepTime - SystemTimer::micros());
			mNextStepTime += desiredStepTime;

			if (sleepTime > 0)
			{
#if _MSC_VER
        usleep(sleepTime);
#else
		usleep((__useconds_t)sleepTime);
#endif
			}
			else if (sleepTime < -1000000)
			{
				mNextStepTime = SystemTimer::micros() + desiredStepTime;
			}
		}
        if (!waitForNewState() || getState()->mLastError)
          return false;

		mStateID = getState()->mStateID;

        if (ii != mSubsamplingFactor-1)
          mSim.activateActions(mStateID);
      }

      for (int ii=0; ii != mMaxStateIdx+1; ii++)
        state[ii] = getState()->var[ii];

      return true;
    }
    bool activateActions(int sz, double *action)
    {
      if (sz != mMaxActionIdx+1)
        return false;

      for (int ii=0; ii != mMaxActionIdx+1; ii++)
        mSim.setJointValue(ii, action[ii]);

      mSim.activateActions(mStateID);

      return true;
    }
    double getStepTime()
    {
      return mSim.getSim()->getStepTime()*mSubsamplingFactor;
    }
    bool isInitialized()
    {
      return mInitialized;
    }
    void setRealtime(bool realtime)
    {
      CODESimAccess access(mSim.getSim());

      if (!mRealtime && realtime)
      {
        mSubsamplingFactor = mSim.getSim()->getSubsamplingFactor();
        mSim.getSim()->setTiming(mStepTime/mSubsamplingFactor, 1);
      }
      else if (mRealtime && !realtime)
      {
        mSim.getSim()->setTiming(mStepTime, mSubsamplingFactor);
        mSubsamplingFactor = 1;
      }
      mRealtime = realtime;
    }
};

MatlabODE *gMatlabODE = NULL;

class CMexMemString
{
  private:
    char *mString;
  public:
    CMexMemString() : mString(NULL) { }
	~CMexMemString()
	{
	  if (mString)
		mxFree(mString);
	}
	operator char*()
	{
	  return mString;
	}
	operator std::string()
	{
      return std::string(mString);
	}
	CMexMemString &operator=(char *rhs)
	{
	  if (mString)
	    mxFree(mString);
	  mString = rhs;
	  return *this;
	}
};

#ifdef WIN32
__declspec(dllexport)
#endif
void __mexFunction(int nlhs, mxArray *plhs[ ],
                   int nrhs, const mxArray *prhs[ ])
{
  CMexMemString func;

  if (nrhs < 1 || !mxIsChar(prhs[0]) || !(func = mxArrayToString(prhs[0])))
    mexErrMsgTxt("Missing function name.");

  if (!strcmp(func, "init"))
  {
	gRanrotB.RandomInit(0);

	CMexMemString file;
    bool showDialog=true;
    if (nrhs < 2 || !mxIsChar(prhs[1]) || !(file = mxArrayToString(prhs[1])))
      mexErrMsgTxt("Missing configuration file name.");

    if (!gMatlabODE)
    {
      for (int ii=2; nrhs > ii; ii++)
      {
        CMexMemString opt;
        if (!mxIsChar(prhs[ii]) || !(opt = mxArrayToString(prhs[ii])))
          mexErrMsgTxt("Options must be string-valued");

        if (!strcmp(opt, "nodialog"))
          showDialog = false;
        else
          mexErrMsgTxt("Unknown option");
      }

      gLogFactory().setLevel(llNotice);
      logNoticeLn(CLog2("main"), "Initializing Matlab ODE interface");

      gMatlabODE = new MatlabODE(showDialog);
      mexLock();
    }

    if (!gMatlabODE->init(file))
      mexErrMsgTxt("Error initializing Matlab ODE interface");
  }
  else if (!gMatlabODE)
  {
    mexErrMsgTxt("Matlab ODE interface not initialized!");
  }
  else if (!strcmp(func, "fini"))
  {
	  //delete gMatlabODE;
    gMatlabODE = NULL;
    logNoticeLn(CLog2("main"), "Matlab ODE interface shut down");
#ifndef _WIN32
    mexUnlock();
#endif
  }
  else if (!gMatlabODE->isInitialized())
  {
    mexErrMsgTxt("No simulation!");
  }
  else if (!strcmp(func, "reset"))
  {
	rg_uint32 seed = 0;
    if (nrhs == 2)
    {
      if (!mxIsNumeric(prhs[1]))
        mexErrMsgTxt("Seed must be a number.");
      seed = (rg_uint32)*mxGetPr(prhs[1]);
    }
    gMatlabODE->setInitialCondition(seed);
  }
  else if (!strcmp(func, "sensor"))
  {
	CMexMemString name;
    if (nrhs < 2 || !mxIsChar(prhs[1]) || !(name = mxArrayToString(prhs[1])))
      mexErrMsgTxt("Missing sensor name.");
    plhs[0] = mxCreateDoubleScalar(gMatlabODE->getStateIndex(name)+1);
  }
  else if (!strcmp(func, "actuator"))
  {
    CMexMemString name;
    if (nrhs < 2 || !mxIsChar(prhs[1]) || !(name = mxArrayToString(prhs[1])))
      mexErrMsgTxt("Missing actuator name.");
    plhs[0] = mxCreateDoubleScalar(gMatlabODE->getActionIndex(name)+1);
  }
  else if (!strcmp(func, "sensors"))
  {
    plhs[0] = mxCreateDoubleScalar(gMatlabODE->getStateSize());
  }
  else if (!strcmp(func, "actuators"))
  {
    plhs[0] = mxCreateDoubleScalar(gMatlabODE->getActionSize());
  }
  else if (!strcmp(func, "sense"))
  {
    plhs[0] = mxCreateDoubleMatrix(1, gMatlabODE->getStateSize(), mxREAL);
    if (!gMatlabODE->readState(mxGetPr(plhs[0])))
      mexErrMsgTxt("Couldn't read state.");
  }
  else if (!strcmp(func, "actuate"))
  {
    if (nrhs < 2 || !mxIsDouble(prhs[1]))
      mexErrMsgTxt("Missing actuation data.");
    if (!gMatlabODE->activateActions(mxGetNumberOfElements(prhs[1]), mxGetPr(prhs[1])))
      mexErrMsgTxt("Actuation error. Did you specify the right amount of elements?");
  }
  else if (!strcmp(func, "step"))
  {
    plhs[0] = mxCreateDoubleScalar(gMatlabODE->getStepTime());
  }
  else if (!strcmp(func, "realtime"))
  {
	bool realtime = true;
    if (nrhs == 2)
    {
      if (!mxIsNumeric(prhs[1]))
        mexErrMsgTxt("Argument must be a number.");
      realtime = *mxGetPr(prhs[1]) > 0.5;
    }
    gMatlabODE->setRealtime(realtime);
  }
  else
  {
    mexErrMsgTxt("Unrecognized command.");
  }
}
