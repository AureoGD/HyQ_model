#
# CMake include file for win32 compatibility library
# Wouter Caarls <wcaarls@tudelft.nl>
#
# 29-03-2010 (wcaarls): Initial revision
#

TARGET_LINK_LIBRARIES(${TARGET} win32)

IF (NOT __WIN32_CMAKE_INCLUDED)
  SET(__WIN32_CMAKE_INCLUDED 1)

  ADD_SUBDIRECTORY(${WORKSPACE_DIR}/dbl/ports/win32 ${WORKSPACE_DIR}/build/win32/${CMAKE_BUILD_TYPE})
ENDIF (NOT __WIN32_CMAKE_INCLUDED)
