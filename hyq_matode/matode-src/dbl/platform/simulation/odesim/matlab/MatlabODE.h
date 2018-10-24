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

#ifndef MATLABODE_H_
#define MATLABODE_H_

#include <Log2.h>

#define REQUIRED_CONFIG_VERSION 1.0

using namespace std;

class SimulationLog
{
  protected:
    CLog2 mLog;
  public:
    SimulationLog() : mLog("sim") { }
};

class MainLog
{
  protected:
    CLog2 mLog;
  public:
    MainLog() : mLog("main") { }
};

#endif /* MATLABODE_H_ */
