@echo off

CLS

TYPE C:\Users\murraym2\Desktop\Tools\bats\boom.txt

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
ECHO  ^| [4] quit                                                      ^|
ECHO  ^|                                                               ^|
ECHO  ^+==============^+============================^+===================^+

CHOICE /C:1234

IF ERRORLEVEL 1 SET M=1
IF ERRORLEVEL 2 SET M=2
IF ERRORLEVEL 3 SET M=3
IF ERRORLEVEL 4 SET M=4
IF %M%==1 GOTO one
IF %M%==2 GOTO two
IF %M%==3 GOTO three
IF %M%==4 GOTO four

:one
ECHO test
ECHO shredding creds..


CHOICE /m "Are you done?" 
IF %ERRORLEVEL%==1 exit
IF %ERRORLEVEL%==2 GOTO menu 

:two
ECHO test 2

CHOICE /m "Are you done?" 
IF %ERRORLEVEL%==1 exit
IF %ERRORLEVEL%==2 GOTO menu

:three
ECHO test 3
CHOICE /m "Are you done?" 
IF %ERRORLEVEL%==1 exit
IF %ERRORLEVEL%==2 GOTO menu

:four
CHOICE /m "Are you done?" 
IF %ERRORLEVEL%==1 exit
IF %ERRORLEVEL%==2 GOTO menu
