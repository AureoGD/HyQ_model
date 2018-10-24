MatODE, a Matlab interface to the Open Dynamics Engine with XML configurability
Delft Biorobotics Laboratory, Delft University of Technology, Delft, The Netherlands.

Prerequisites
-------------

GCC (tested with 4.4) or MSVC (tested with 2010)
CMake (tested with 2.8.12)
Qt headers and statically compiled libraries (tested with 4.8.6)
Matlab (tested with R2013b (Windows) and R2014a (Linux))
ODE headers and libraries (Linux only; make sure to use double precision)

Compilation
-----------

We use the CMake build system. Use cmake or cmake-gui, with

matode-code/dbl/platform/simulation/odesim/matlab

as the source directory, and

matode-code/build/matode

as the build directory. Make sure the Matlab path is found correctly; edit CMakeLists.txt if not. Then run "make"/"nmake" in the build directory, or load "odesim-matlab.sln" and hit F7.

A build log for Ubuntu 14.04 can be found in BUILDING.Ubuntu.

It should not be necessary to rebuild the mex file, but this can be done with Matlab itself. Make sure to link with [lib]matode[64].{so,dll}

Authors
-------

Wouter Caarls <wouter@caarls.org>
Erik Schuitema

Licensing
---------

Copyright (c) 2010-2014 Delft Biorobotics Laboratory (DBL).
Copyright (c) 2014-2015 Wouter Caarls.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
