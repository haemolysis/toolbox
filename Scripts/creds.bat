@echo off
color 02

:: this script clears all microsoft office credentials from Credential Manager

set /p check="Type yes to continue: "
IF "%check%"=="yes" (
    cmdkey.exe /list > "%TEMP%\List.txt"
    findstr.exe Target "%TEMP%\List.txt" > "%TEMP%\tokensonly.txt"
    FOR /F "tokens=1,2 delims= " %%G IN (%TEMP%\tokensonly.txt) DO cmdkey.exe /delete:%%H
    del "%TEMP%\List.txt" /s /f /q
    del "%TEMP%\tokensonly.txt" /s /f /q
    pause
)

IF "%check%" NOT "yes" (
    exit
)
