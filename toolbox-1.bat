@echo off

CLS

:: this is a toolbox, of sorts

:menu

ECHO.
ECHO                            -------------
ECHO                           //          //   
ECHO                          //          //
ECHO  ^+======================^|^|==========^|^|===========================^+
ECHO  ^|Welcome to the TOOLBOX. Please select an option from the list: ^| 
ECHO  ^|                                                               ^|
ECHO  ^| [1] clear credentials                                         ^|
ECHO  ^| [2] temp profile fix                                          ^|
ECHO  ^| [3] config manager meltdown                                   ^|
ECHO  ^| [4] update google chrome                                      ^|
ECHO  ^| [5] OCN Migration info tool                                   ^|
ECHO  ^| [6] toggle hibernation ^(free up 6 gb ^+ space^) instantly       ^|
ECHO  ^| [7] update wireless certs                                     ^|
ECHO  ^| [9] quit                                                      ^|
ECHO  ^|                                                               ^|
ECHO  ^+==============^+============================^+===================^+

CHOICE /C:123456789

IF ERRORLEVEL 1 SET M=1
IF ERRORLEVEL 2 SET M=2
IF ERRORLEVEL 3 SET M=3
IF ERRORLEVEL 4 SET M=4
IF ERRORLEVEL 5 SET M=5
IF ERRORLEVEL 6 SET M=6
IF ERRORLEVEL 7 SET M=7
IF ERRORLEVEL 8 SET M=8
IF ERRORLEVEL 9 SET M=9

IF %M%==1 GOTO one
IF %M%==2 GOTO two
IF %M%==3 GOTO three
IF %M%==4 GOTO four
IF %M%==5 GOTO five
IF %M%==6 GOTO six
IF %M%==7 GOTO seven
IF %M%==8 GOTO eight
IF %M%==9 GOTO nine

:one
ECHO.
ECHO ^+==================^+
ECHO  shredding creds...
ECHO ^+==================^+
ECHO.

cmdkey.exe /list > "%TEMP%\List.txt"
findstr.exe Target "%TEMP%\List.txt" > "%TEMP%\tokensonly.txt"
FOR /F "tokens=1,2 delims= " %%G IN (%TEMP%\tokensonly.txt) DO cmdkey.exe /delete:%%H
del "%TEMP%\List.txt" /s /f /q
del "%TEMP%\tokensonly.txt" /s /f /q

CHOICE /m "Are you done?" 
IF %ERRORLEVEL%==1 exit
IF %ERRORLEVEL%==2 GOTO menu 

:two
ECHO.
ECHO ^+=====================^+
ECHO  Fixing the profile...
ECHO ^+=====================^+
pause
REG ADD "HKLM\System\CurrentControlSet\Services\CSC\Parameters" /v FormatDatabase /t REG_DWORD /d 1 /f
CHOICE /m "Restart now?"
IF %ERRORLEVEL%==1 SHUTDOWN /r /f /t 0
IF %ERRORLEVEL%==2 GOTO menu

:three
ECHO.
ECHO ^+======================^+
ECHO  Greasing the wheels...
ECHO ^+======================^+

echo Administrative permissions required. Detecting permissions...

net session >nul 2>&1
if %ERRORLEVEL% == 0 (
    echo "Success: got admin. "
    pause
    WMIC /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000121}" /NOINTERACTIVE
    WMIC /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000003}" /NOINTERACTIVE
    WMIC /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000010}" /NOINTERACTIVE
    WMIC /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000001}" /NOINTERACTIVE
    WMIC /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000021}" /NOINTERACTIVE
    WMIC /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000022}" /NOINTERACTIVE
    WMIC /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000002}" /NOINTERACTIVE
    WMIC /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000031}" /NOINTERACTIVE
    WMIC /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000108}" /NOINTERACTIVE
    WMIC /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000113}" /NOINTERACTIVE
    WMIC /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000111}" /NOINTERACTIVE
    WMIC /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000026}" /NOINTERACTIVE
    WMIC /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000027}" /NOINTERACTIVE
    WMIC /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000032}" /NOINTERACTIVE
    echo "Done.. "
    pause >nul
    ) else (
        echo "Failure: Current permissions inadequate.."
        echo "please exit.."
    )
CHOICE /m "Are you done?" 
IF %ERRORLEVEL%==1 exit
IF %ERRORLEVEL%==2 GOTO menu

:four

REG DELETE "HKLM\SOFTWARE\Policies\Google" /f
IF %ERRORLEVEL% == 0 (
    ECHO Done..
) else (
    ECHO.
    ECHO ^+==================^+
    ECHO     Needs admin... 
    ECHO ^+==================^+
)
CHOICE /m "Are you done?" 
IF %ERRORLEVEL%==1 exit
IF %ERRORLEVEL%==2 GOTO menu

:five

ECHO.
hostname
ipconfig /all | findstr IPv4
pause
CHOICE /m "Are you done?" 
IF %ERRORLEVEL%==1 exit
IF %ERRORLEVEL%==2 GOTO menu

:six
ECHO.
ECHO ^+===========================^+
ECHO ^| Turn hibernate on or off: ^|
ECHO ^| [1] off                   ^|
ECHO ^| [2] on                    ^|
ECHO ^| [3] i've made a mistake   ^|
ECHO ^+===========================^+
ECHO.

CHOICE /C:123

IF ERRORLEVEL 1 SET N=1
IF ERRORLEVEL 2 SET N=2
IF ERRORLEVEL 3 SET N=3

IF %N% == 1 GOTO hone
IF %N% == 2 GOTO htwo
IF %N% == 3 GOTO hthree

:hone
powercfg /hibernate off
ECHO done...
pause
exit

:htwo
powercfg /hibernate on
ECHO done...
pause
exit

:hthree
GOTO menu

:seven
ECHO.
ECHO ^+=========================^+
ECHO ^| updating wireless certs ^|
ECHO ^+=========================^+
ECHO.

certutil -pulse
pause
CHOICE /m "Are you done?" 
IF %ERRORLEVEL%==1 exit
IF %ERRORLEVEL%==2 GOTO menu


:eight
ECHO not used

:nine
exit


