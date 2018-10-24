#
# CMake include file for tinyxml library
# Wouter Caarls <wcaarls@tudelft.nl>
#
# 29-03-2010 (wcaarls): Initial revision
#

IF (TINYXML_INCLUDE_DIR)
  message("-- ${TARGET} using external tinyxml include dir: ${TINYXML_INCLUDE_DIR}")
  INCLUDE_DIRECTORIES(${TINYXML_INCLUDE_DIR})
  message("-- ${TARGET} using tinyxml cflags: ${TINYXML_CFLAGS}")
  ADD_DEFINITIONS(${TINYXML_CFLAGS})
ELSE(TINYXML_INCLUDE_DIR)
  INCLUDE_DIRECTORIES(${WORKSPACE_DIR}/dbl/externals/tinyxml)
  TARGET_LINK_LIBRARIES(${TARGET} tinyxml)

  IF (NOT __TINYXML_CMAKE_INCLUDED)
    SET(__TINYXML_CMAKE_INCLUDED 1)

    ADD_SUBDIRECTORY(${WORKSPACE_DIR}/dbl/externals/tinyxml ${WORKSPACE_DIR}/build/tinyxml/${CMAKE_BUILD_TYPE}${COMPILER_VERSION})
  ENDIF (NOT __TINYXML_CMAKE_INCLUDED)
ENDIF (TINYXML_INCLUDE_DIR)

