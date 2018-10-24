#!/bin/sh
CC=gcc-4.1 CXX=g++-4.1 cmake ..
make
./mex.sh
