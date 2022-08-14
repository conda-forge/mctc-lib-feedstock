meson setup ^
    _build ^
    --prefix=%LIBRARY_PREFIX% ^
    --libdir=lib ^
    --buildtype=release ^
    --default-library=shared ^
    -Djson=disabled
if errorlevel 1 exit 1

meson compile -C _build
if errorlevel 1 exit 1
meson test -C _build --no-rebuild --print-errorlogs
if errorlevel 1 exit 1
meson install -C _build --no-rebuild
if errorlevel 1 exit 1
rm %LIBRARY_PREFIX%\bin\mctc-convert.exe


