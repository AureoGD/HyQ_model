#!/bin/sh
CC=gcc-4.1 CXX=g++-4.1 mex ../matode.cpp -L . -Wl,-rpath,`pwd` -Wl,-rpath,/usr/lib -lmatode
