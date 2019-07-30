@echo off

:: this script fixes temporary profile issues on windows 8.1, and possible other versions

setlocal

set /p o="Enter computer number: "
set /p chk="Is %o% correct? Type yes to proceed: "

IF "%chk%"=="yes" (
    REG ADD "\\%o%\HKLM\System\CurrentControlSet\Services\CSC\Parameters" /v FormatDatabase /t REG_DWORD /d 1 /f
    echo "Done..."
    pause
    set /p s="Press enter to restart: "
    SHUTDOWN /r /f /t 0 /m "\\%o%"
)

