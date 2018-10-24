#
# CMake include file for Matlab mex logging library
# Wouter Caarls <w.caarls@tudelft.nl>
#
# 15-04-2010 (wcaarls): Initial revision
#

INCLUDE (${WORKSPACE_DIR}/dbl/platform/io/logging/logging.cmake)

TARGET_LINK_LIBRARIES(${TARGET} mexlogging)

IF (NOT __MEXLOGGING_CMAKE_INCLUDED)
  SET(__MEXLOGGING_CMAKE_INCLUDED 1)

  ADD_SUBDIRECTORY(${WORKSPACE_DIR}/dbl/platform/io/logging/mex ${WORKSPACE_DIR}/build/mexlogging/${CMAKE_BUILD_TYPE}${COMPILER_VERSION})
ENDIF (NOT __MEXLOGGING_CMAKE_INCLUDED)
