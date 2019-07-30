@echo off

:: this script finds info from ipconfig

:start

set /p str= "Please choose what you want to search for. Case Sensitive:  "
ipconfig /all | findstr %str%

pause
goto start
