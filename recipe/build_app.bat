mkdir %LIBRARY_BIN%
set PKG_CONFIG_PATH=%LIBRARY_PREFIX%\lib\pkgconfig
for /f "usebackq tokens=*" %%a in (`pkg-config --cflags --libs mctc-lib`) do MCTC_LIB=%%a
gfortran app\main.f90 -o %LIBRARY_BIN%\mctc-convert.exe %MCTC_LIB%
if errorlevel 1 exit 1
