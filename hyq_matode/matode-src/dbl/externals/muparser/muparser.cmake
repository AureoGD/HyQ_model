#
# CMake include file for muparser library
# Wouter Caarls <wcaarls@tudelft.nl>
#
# 29-03-2010 (wcaarls): Initial revision
#

INCLUDE_DIRECTORIES(${WORKSPACE_DIR}/dbl/externals/muparser/include)
TARGET_LINK_LIBRARIES(${TARGET} muparser)

IF (NOT __MUPARSER_CMAKE_INCLUDED)
  SET(__MUPARSER_CMAKE_INCLUDED 1)

  ADD_SUBDIRECTORY(${WORKSPACE_DIR}/dbl/externals/muparser ${WORKSPACE_DIR}/build/muparser/${CMAKE_BUILD_TYPE}${COMPILER_VERSION})
ENDIF (NOT __MUPARSER_CMAKE_INCLUDED)
