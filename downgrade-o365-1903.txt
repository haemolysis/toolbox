@ECHO OFF

ECHO Please connect to an external network
pause

cd %programfiles%\Common Files\Microsoft Shared\ClickToRun\

OfficeC2RClient.exe /update user updatetoversion=16.0.11425.20244
