#
# CMake include file for configuration library
# Wouter Caarls <w.caarls@tudelft.nl>
#
# 29-03-2010 (wcaarls): Initial revision
#

INCLUDE (${WORKSPACE_DIR}/dbl/externals/muparser/muparser.cmake)
INCLUDE (${WORKSPACE_DIR}/dbl/externals/tinyxml/tinyxml.cmake)
INCLUDE (${WORKSPACE_DIR}/dbl/platform/io/logging/logging.cmake)

INCLUDE_DIRECTORIES(${WORKSPACE_DIR}/dbl/platform/io/configuration)
TARGET_LINK_LIBRARIES(${TARGET} configuration)

IF (NOT __CONFIGURATION_CMAKE_INCLUDED)
  SET(__CONFIGURATION_CMAKE_INCLUDED 1)

  ADD_SUBDIRECTORY(${WORKSPACE_DIR}/dbl/platform/io/configuration ${WORKSPACE_DIR}/build/configuration/${CMAKE_BUILD_TYPE}${COMPILER_VERSION})
ENDIF (NOT __CONFIGURATION_CMAKE_INCLUDED)
