@echo off
setlocal

type C:\Users\murraym2\Desktop\Tools\bats\boom.txt 

set /p o="Enter ORG number: "
set /p chk="Is %o% correct? Type yes to proceed: "

IF "%chk%"=="yes" (
    REG ADD "\\%o%\HKLM\System\CurrentControlSet\Services\CSC\Parameters" /v FormatDatabase /t REG_DWORD /d 1 /f
    echo "Done..."
    pause
    set /p s="Press enter to restart machine"
    SHUTDOWN /r /f /t 0 /m "\\%o%"
)