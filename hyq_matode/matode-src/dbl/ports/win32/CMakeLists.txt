#
# CMake build file for win32 compatibility library
# Wouter Caarls <w.caarls@tudelft.nl>
#
# 30-03-2010 (wcaarls): Initial revision
#

# Preamble
PROJECT(win32)
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

# Setup project environment
GET_FILENAME_COMPONENT(BASE_DIR ${CMAKE_CURRENT_LIST_FILE} PATH)
SET(WORKSPACE_DIR ${BASE_DIR}/../../..)
SET(TARGET win32)

# Specify sources
ADD_LIBRARY(${TARGET} ${BASE_DIR}/src/mqueue.cpp
                      ${BASE_DIR}/src/time.cpp
           )
