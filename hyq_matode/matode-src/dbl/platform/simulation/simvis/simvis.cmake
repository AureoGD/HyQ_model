#
# CMake include file for simvis library
# Wouter Caarls <w.caarls@tudelft.nl>
#
# 29-03-2010 (wcaarls): Initial revision
#

INCLUDE (${WORKSPACE_DIR}/dbl/platform/io/configuration/configuration.cmake)
INCLUDE (${WORKSPACE_DIR}/dbl/platform/gui/qt/qt.cmake)
#INCLUDE (${WORKSPACE_DIR}/dbl/platform/math/math.cmake)

INCLUDE_DIRECTORIES (${WORKSPACE_DIR}/dbl/platform/simulation/simvis)
TARGET_LINK_LIBRARIES(${TARGET} simvis)

IF (NOT __SIMVIS_CMAKE_INCLUDED)
  SET(__SIMVIS_CMAKE_INCLUDED 1)

  ADD_SUBDIRECTORY(${WORKSPACE_DIR}/dbl/platform/simulation/simvis ${WORKSPACE_DIR}/build/simvis/${CMAKE_BUILD_TYPE}${COMPILER_VERSION})
ENDIF (NOT __SIMVIS_CMAKE_INCLUDED)
