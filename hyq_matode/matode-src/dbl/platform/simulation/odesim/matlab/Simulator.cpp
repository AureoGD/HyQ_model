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

#include "Simulator.h"

#define mLog SimulationLog::mLog

Simulator::Simulator():
  CGenericODESim("MatlabODE", 8),
  PosixNonRealTimeThread("Simulator-thread", BaseThread::NORMAL),
  mEvtActuation(false, false)
{
  mLogDebugLn("Simulator constructor");

  mStepCounter        = 0;
  resetActuationValues();
}

bool Simulator::readConfig(const CConfigSection &configSection, bool noObjects)
{
  bool result = true;
  result &= CSTGODESim<GenericState>::readConfig(configSection, noObjects);
  return result;
}

// Waits and returns true when new actuation signals have arrived
bool Simulator::shouldStep()
{
  // Wait for the event to become signaled
  return mEvtActuation.wait();
}

bool Simulator::start()
{
  // Clear state and internal actuation values
  resetActuationValues();
  mState.clear();
  // Clear the actuation event
  mEvtActuation = false;
  // Clear state counter
  mStepCounter = 0;

  mSim.pause(true);
  bool result = mSim.start();
  PosixNonRealTimeThread::start();
  return result;
}

bool Simulator::stop()
{
  // Signal the thread that it should stop
  PosixNonRealTimeThread::stop();
  // Force the loop to continue
  mEvtActuation = true;
  //printf("[DEBUG] mEvtActuation is now %d\n", (bool)mEvtActuation);
  // Await termination
  PosixNonRealTimeThread::awaitTermination();
  return mSim.stop();
}

void Simulator::fillState()
{
  // Fill generic state information
  CGenericODESim::fillState();

  // Set state ID
  mState.mStateID = mStepCounter++;
}

void Simulator::run()
{
  // Broadcast the initial state of the robot so that the policy
  // can calculate the initial actuation signals.
  // shouldStep() will wait for the initial actuation signals from the policy (it is reset in start())
  setInitialCondition();

  mLogNoticeLn("Step time: " << mSim.getStepTime() << ", subsamplingfactor: " << mSim.getSubsamplingFactor());

  fillState();

  if (!broadcast())
    mLogWarningLn("STG state broadcast failed on one of the receivers (error " << errno << ")!");

  // Main loop
  mLogDebugLn("CrwSimulator::run() is entering main loop...");
  while (!shouldStop())
  {
    emit drawFrame();

    if (shouldStep())
    {
      mState.mLastError = !mSim.singleStep();

      // Since the step is done now, we don't need to ask for sim access, so just fill the state struct
      fillState();

      // Now send our state to the queue
      if (!broadcast())
        mLogWarningLn("STG state broadcast failed on one of the receivers (error " << errno << ")!");
    }
  }
  mLogNoticeLn("CrwSimulator::run() has come to an end.");
}

// Call activateActions() at a moment of your choosing to put the new control actions into effect
int Simulator::activateActions(const uint64_t& stateID)
{
  CGenericODESim::activateActions(stateID);

  // After we're done, signal (the main loop) that new actuation information is available
  mEvtActuation = true;

  return 0;
}

void Simulator::setInitialCondition(rg_uint32 seed)
{
  CGenericODESim::setInitialCondition(seed);

  // Acquire sim access so that we are not altering ODE objects while they are drawn, for example
  CODESimAccess simAccess(getSim());

  CODEObject* robot = simAccess.resolveObject("robot");
  if (robot == NULL)
  {
    mLogWarningLn("Robot is null!");
    return; // Something bad is going on
  }

  robot->setInitialCondition();

  // Set angle rates
  for (unsigned int iBody=0; iBody != robot->getBodies().size(); iBody++)
  {
    robot->getBodies()[iBody]->setAngularVel(0, 0, 0);
    dVector3 nullVec = {0, 0, 0, 0};
    robot->getBodies()[iBody]->setLinearVel(nullVec);
  }
}
