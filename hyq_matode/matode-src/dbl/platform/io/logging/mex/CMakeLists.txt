#
# CMake build file for Matlab mex logging library
# Wouter Caarls <w.caarls@tudelft.nl>
#
# 15-04-2010 (wcaarls): Initial revision
#

# Preamble
PROJECT(mexloggig)
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

# Setup project environment
GET_FILENAME_COMPONENT(BASE_DIR ${CMAKE_CURRENT_LIST_FILE} PATH)
SET(WORKSPACE_DIR ${BASE_DIR}/../../../../..)
SET(TARGET mexlogging)

# Specify sources
ADD_LIBRARY(${TARGET} ${BASE_DIR}/MexLog2.cpp
           )

INCLUDE (${WORKSPACE_DIR}/dbl/platform/io/logging/logging.cmake)
