@echo on

if "%PY_VER%" == "2.7" (
    call "%LOCALAPPDATA%\Programs\Common\Microsoft\Visual C++ for Python\9.0\vcvarsall.bat"
)

mkdir build
cd build

cmake .. -G"NMake Makefiles"               ^
 -DBUILD_SHARED_LIBS=1                     ^
 -DLIB_SUFFIX=                             ^
 -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
 -DUSE_MSVC_RUNTIME_LIBRARY_DLL=1          ^
 -DGLFW_BUILD_EXAMPLES=0                   ^
 -DGLFW_BUILD_TESTS=0                      ^
 -DGLFW_BUILD_DOCS=0

nmake install