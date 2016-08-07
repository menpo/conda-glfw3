#!/bin/bash

export MACOSX_DEPLOYMENT_TARGET="10.9"

mkdir build
cd build

cmake .. -DBUILD_SHARED_LIBS=1 -DCMAKE_INSTALL_PREFIX=$PREFIX

make
make install

# Manually run one of the tests
DISPLAY=":99.0" tests/glfwinfo
