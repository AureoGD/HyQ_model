#
# CMake build file for muparser library
# Wouter Caarls <w.caarls@tudelft.nl>
#
# 29-03-2010 (wcaarls): Initial revision
#

# Preamble
PROJECT(muparser)
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

# Setup project environment
GET_FILENAME_COMPONENT(BASE_DIR ${CMAKE_CURRENT_LIST_FILE} PATH)
SET(WORKSPACE_DIR ${BASE_DIR}/../../..)
SET(TARGET muparser)

# Specify sources
ADD_LIBRARY(${TARGET} ${BASE_DIR}/src/muParser.cpp
                      ${BASE_DIR}/src/muParserBase.cpp
                      ${BASE_DIR}/src/muParserBytecode.cpp
                      ${BASE_DIR}/src/muParserCallback.cpp
                      ${BASE_DIR}/src/muParserError.cpp
                      ${BASE_DIR}/src/muParserInt.cpp
                      ${BASE_DIR}/src/muParserTest.cpp
                      ${BASE_DIR}/src/muParserTokenReader.cpp
           )
