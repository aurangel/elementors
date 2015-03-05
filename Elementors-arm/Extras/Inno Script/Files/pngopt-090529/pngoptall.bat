@echo off
for %1 %%i in (*.png) do (
 binmay.exe -i "%%~i" -o nul -s "00 00 00 08 61 63 54 4c" 2> nul
 if ERRORLEVEL 1 (
  touch.exe -r "%%~i" "%%~i.time"
  optipng.exe -zw32k -zc9 -zm9 -zs0,3 -f0,5 -i0 "%%~i"
  if not ERRORLEVEL 1 (
   advdef.exe -z -4 "%%~i"
   deflopt.exe -b "%%~i"
   pngout /y /b0 "%%~i"
   if not ERRORLEVEL 2 (
    advdef.exe -z -4 "%%~i"
    deflopt.exe -b "%%~i"
   )
  )
  touch.exe -r "%%~i.time" "%%~i"
  if exist "%%~i.time" del "%%~i.time"
 ) else (
  ren "%%~i" "%%~ni.apng"
 )
)