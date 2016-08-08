#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  export MACOSX_DEPLOYMENT_TARGET="10.9"
fi

mkdir build
cd build

cmake .. -DBUILD_SHARED_LIBS=1 -DCMAKE_INSTALL_PREFIX=$PREFIX -DGLFW_USE_CHDIR=0 -DGLFW_USE_MENUBAR=0

make
make install

if [[ "$OSTYPE" == "darwin"* ]]; then
  install_name_tool -id @rpath/libglfw.3.dylib $PREFIX/lib/libglfw.3.2.dylib
  DYLD_LIBRARY_PATH="$PREFIX/lib" DISPLAY=":99.0" tests/glfwinfo
elif [[ "$OSTYPE" == "linux"* ]]; then
  LD_LIBRARY_PATH="$PREFIX/lib" DISPLAY=":99.0" tests/glfwinfo
fi
