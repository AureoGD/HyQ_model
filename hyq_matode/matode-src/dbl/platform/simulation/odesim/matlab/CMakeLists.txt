#
# CMake build file for odesim-matlab
# Wouter Caarls <w.caarls@tudelft.nl>
#
# 30-03-2010 (wcaarls): Initial revision
#

# Preamble
PROJECT(odesim-matlab)
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

# set default build type
IF (NOT CMAKE_BUILD_TYPE)
  SET(CMAKE_BUILD_TYPE Debug)
ENDIF (NOT CMAKE_BUILD_TYPE)

MESSAGE (STATUS "Build type: " ${CMAKE_BUILD_TYPE})

# Setup project environment
GET_FILENAME_COMPONENT(BASE_DIR ${CMAKE_CURRENT_LIST_FILE} PATH)
SET(WORKSPACE_DIR ${BASE_DIR}/../../../../..)
IF(CMAKE_SIZEOF_VOID_P MATCHES 8)
  SET(TARGET matode64)
ELSE()
  SET(TARGET matode)
ENDIF()

# Find Matlab
IF (WIN32)
  IF (CMAKE_CL_64)
    FIND_PATH(MATLAB_INCLUDE_DIR mex.h PATHS "C:/Program Files/MATLAB" "D:/Program Files/MATLAB" "C:/Program Files (x86)/MATLAB" "D:/Program Files (x86)/MATLAB" PATH_SUFFIXES R2007a/extern/include R2007b/extern/include R2008a/extern/include R2008b/extern/include R2009a/extern/include R2009b/extern/include R2009bSP1/extern/include R2010a/extern/include R2010b/extern/include R2010bSP1/extern/include)
    SET(MATLAB_LINK_DIR ${MATLAB_INCLUDE_DIR}/../lib/win64/microsoft)
  ELSE()
    FIND_PATH(MATLAB_INCLUDE_DIR mex.h PATHS "C:/Program Files (x86)/MATLAB" "D:/Program Files (x86)/MATLAB" "C:/Program Files/MATLAB" "D:/Program Files/MATLAB" PATH_SUFFIXES R2007a/extern/include R2007b/extern/include R2008a/extern/include R2008b/extern/include R2009a/extern/include R2009b/extern/include R2009bSP1/extern/include R2010a/extern/include R2010b/extern/include R2010bSP1/extern/include)
    SET(MATLAB_LINK_DIR ${MATLAB_INCLUDE_DIR}/../lib/win32/microsoft)
  ENDIF()
  SET(MATLAB_LIBRARIES libmex libmx)
ELSE()
  FIND_PATH(MATLAB_INCLUDE_DIR mex.h PATHS /opt/matlab/extern/include /usr/local/matlab/extern/include /usr/local/include/matlab /usr/include/matlab /opt/MATLAB/R2014a/extern/include)
ENDIF()

message("-- Using Matlab include dir: ${MATLAB_INCLUDE_DIR}")
message("-- Using Matlab lib dir: ${MATLAB_LINK_DIR}")

IF (WIN32)
  INCLUDE (${WORKSPACE_DIR}/dbl/ports/win32/win32_pre.cmake)
ENDIF (WIN32)

# Qt stuff
SET(QT_USE_QTOPENGL TRUE)
find_package(Qt4 REQUIRED)

IF(QT4_FOUND)
  include(${QT_USE_FILE})
  INCLUDE_DIRECTORIES(   
  ${QT_INCLUDE_DIR}      
  )
ENDIF(QT4_FOUND)

SET(matlabode_MOC_HDRS
        ${BASE_DIR}/Dialog.h
        ${BASE_DIR}/Simulator.h
)

QT4_WRAP_CPP(matlabode_MOC_SRCS ${matlabode_MOC_HDRS})

# ODE floating point precision definition
ADD_DEFINITIONS(-DdDOUBLE)

INCLUDE (${WORKSPACE_DIR}/dbl/platform/include.cmake)
IF (CMAKE_COMPILER_IS_GNUCXX)
  SET(CMAKE_CXX_FLAGS "-fmessage-length=0 -fdiagnostics-show-option -Wall -Wextra -Wno-unused-parameter -fPIC")
  # Release build
  SET(CMAKE_CXX_FLAGS_RELEASE "-g -O3")
  # Debug Build
  SET(CMAKE_CXX_FLAGS_DEBUG "-g")
ENDIF (CMAKE_COMPILER_IS_GNUCXX)

# MATLAB stuff
INCLUDE_DIRECTORIES(${MATLAB_INCLUDE_DIR})
LINK_DIRECTORIES(${MATLAB_LINK_DIR})

# Specify sources
ADD_LIBRARY(${TARGET} SHARED
                      ${BASE_DIR}/MatlabODE.cpp
                      ${BASE_DIR}/Dialog.cpp
                      ${BASE_DIR}/Simulator.cpp
                      ${matlabode_MOC_SRCS}
           )

# Include dependencies
INCLUDE (${WORKSPACE_DIR}/dbl/platform/io/logging/mexlogging.cmake)
INCLUDE (${WORKSPACE_DIR}/dbl/platform/io/configuration/configuration.cmake)
INCLUDE (${WORKSPACE_DIR}/dbl/platform/gui/qt/qt.cmake)
INCLUDE (${WORKSPACE_DIR}/dbl/platform/simulation/odesim/odesim.cmake)
INCLUDE (${WORKSPACE_DIR}/dbl/platform/time/time.cmake)

IF (WIN32)
  INCLUDE (${WORKSPACE_DIR}/dbl/ports/win32/win32.cmake)
ENDIF (WIN32)

# Additional libraries
TARGET_LINK_LIBRARIES(${TARGET} ${QT_LIBRARIES} ${MATLAB_LIBRARIES})
