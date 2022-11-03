REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%

set PYTHON_DIR=%DOWNLOADS_DIR%\python-3.7.9-amd64-portable

set current_directory=%~dp0
set current_directory_linux=%current_directory:\=/%

SET PATH=^
%DOWNLOADS_DIR%\PortableGit\bin;^
%DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0;^
%DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\bin;^
%DOWNLOADS_DIR%\cmake-3.22.2-windows-x86_64\bin;^
%PYTHON_DIR%;^
%PYTHON_DIR%Scripts;^
%current_directory%emsdk;^
%current_directory%emsdk\upstream\emscripten;^
%current_directory%emsdk\node\14.18.2_64bit\bin;^

SET EMSDK=%current_directory%emsdk
SET EMSDK_NODE=%current_directory%emsdk/node/14.18.2_64bit/bin/node.exe
SET EMSDK_PYTHON=%current_directory%emsdk/python/3.9.2-nuget_64bit/python.exe
SET JAVA_HOME=%current_directory%emsdk/java/8.152_64bit

@REM cd emsdk
@REM emsdk install latest
@REM emsdk activate latest

@REM set PATH_OLD=%PATH%
@REM cd emsdk
@REM emsdk activate
@REM emsdk_env.bat
@REM set PATH=%PATH%;%PATH_OLD%
@REM pause

cmake.exe -G"MinGW Makefiles" ^
-DCMAKE_TOOLCHAIN_FILE="%current_directory_linux%emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake" ^
-DEMSCRIPTEN_ROOT="%current_directory_linux%emsdk/upstream/emscripten" ^
-DCMAKE_BUILD_TYPE=Debug ^
-B./build &&^
cd build &&^
cmake --build . &&^
echo "Successful build"
pause