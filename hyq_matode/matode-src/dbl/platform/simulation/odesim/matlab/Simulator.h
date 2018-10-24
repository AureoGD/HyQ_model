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

#ifndef SIMULATOR_H_
#define SIMULATOR_H_

#include <QtCore/qobject.h>
#include <GenericODESim.h>

#include "MatlabODE.h"

class Simulator: public QObject, public CGenericODESim, private PosixNonRealTimeThread, protected SimulationLog
{
    Q_OBJECT

  protected:
    uint64_t    mStepCounter;
    CWaitEvent  mEvtActuation;

    //void      resetBindData();
    // Main function from AbstractXenomaiTask
    // that has to be overridden in order to
    // implement actual task functionality.
    void      run();
    bool      shouldStep(); // Waits for an actuation signal and returns true when a new step should be made
    void      fillState();

  public:
    Simulator();

    bool      start();
    bool      stop();

    virtual void setInitialCondition(rg_uint32 seed=0);

    virtual bool readConfig(const CConfigSection &configSection, bool noObjects=false);

    // Call activateActions() at a moment of your choosing to put the new control actions into effect
    virtual int activateActions(const uint64_t& stateID);

  signals:
    void      drawFrame();  // signal to emit to the GUI to initiate drawing of the screen
};

#endif /* SIMULATOR_H_ */
