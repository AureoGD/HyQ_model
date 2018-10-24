#
# CMake pre-include file for win32 compatibility library
# Wouter Caarls <wcaarls@tudelft.nl>
#
# 29-03-2010 (wcaarls): Initial revision
#

INCLUDE_DIRECTORIES(${WORKSPACE_DIR}/dbl/ports/win32/include)
LINK_DIRECTORIES(${WORKSPACE_DIR}/dbl/ports/win32/lib)
ADD_DEFINITIONS(-D_CRT_SECURE_NO_DEPRECATE)

IF (NOT ODE_LIB)
  IF (CMAKE_CL_64)
    SET (ODE_LIB ode_double_x64)
  ELSE()
    SET (ODE_LIB ode_double)
  ENDIF()
ENDIF (NOT ODE_LIB)

IF (NOT PTHREAD_LIB)
  IF (CMAKE_CL_64)
    SET (PTHREAD_LIB pthreadVC2_x64)
  ELSE()
    SET (PTHREAD_LIB pthreadVC2)
  ENDIF()
ENDIF (NOT PTHREAD_LIB)
