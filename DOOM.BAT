@echo off

SET DOOMDIR=C:\GAMES\ZDOOM
SET PWADDIR=%DOOMDIR%\WADS
SET mainIWAD=DOOM2.WAD
SET ZPORT=GZDOOM.EXE

IF NOT EXIST %DOOMDIR% GOTO DOOMDIRFAIL
CD %DOOMDIR%
:MENU
CLS
ECHO ===========================
ECHO =      ZDOOM LAUNCHER     =
ECHO ===========================
ECHO.
ECHO Selected IWAD:   %mainIWAD%
ECHO DOOM executable: %ZPORT%
ECHO.
ECHO 1 - Launch normaly
ECHO 2 - Launch with WADs...
ECHO 3 - Join Multiplayer game...
ECHO 4 - Custom Run...
ECHO 5 - Change main IWAD
ECHO 6 - Change DOOM executable
ECHO 7 - Quit
ECHO.
CHOICE /C 1234567 /N /M "Select menu number "
IF %ERRORLEVEL%==1 GOTO NORMAL
IF %ERRORLEVEL%==2 GOTO WADS
IF %ERRORLEVEL%==3 GOTO MULTIPLAYER
IF %ERRORLEVEL%==4 GOTO CUSTOM
IF %ERRORLEVEL%==5 GOTO CHANGEIWAD
IF %ERRORLEVEL%==6 GOTO CHANGEEXEC
IF %ERRORLEVEL%==7 GOTO EXIT 

:NORMAL
ECHO Launching %ZPORT% -IWAD %mainIWAD% ...
START %ZPORT% -IWAD %mainIWAD%
GOTO MENU

:WADS
CLS
ECHO  WAD(S) SELECT
ECHO ===============
IF NOT EXIST %PWADDIR% GOTO PWADDIRFAIL
ECHO WAD files in %PWADDIR% folder:
ECHO Note: names in [] brackets are subfolders
ECHO ----------------------------------------------
ECHO.
DIR /W %PWADDIR%
ECHO ----------------------------------------------
GOTO WADPROMPT
:PWADDIRFAIL
ECHO.
ECHO Looks like %PWADDIR% isn't your Add-Ons folder, please edit this .BAT and change your PWADDIR
:WADPROMPT
ECHO.
ECHO Current DIR is %DOOMDIR%
SET /P WADlist=WAD file(s) to use: 
ECHO Launching %ZPORT% -FILE %WADlist% -IWAD %mainIWAD% ...
START %ZPORT% -FILE %WADlist% -IWAD %mainIWAD%
GOTO MENU

:MULTIPLAYER
CLS
ECHO  JOIN MULTIPLAYER
ECHO ==================
ECHO Join a multiplayer game from there
ECHO Use -FILE [wads_filename(s)] if server requieres custom WADs
ECHO Don't forget for -DEATHMATCH parameter if server started a DM game
ECHO.
SET /P IPadress=IP Adress of host: 
ECHO Launching %ZPORT% -JOIN %IPadress% -IWAD %mainIWAD% ...
START %ZPORT% -JOIN %IPadress% -IWAD %mainIWAD%
GOTO MENU

:CUSTOM
CLS
ECHO  CUSTOM RUN SETUP
ECHO ==================
ECHO You can type custom command line parameters to run ZDOOM with
ECHO Useful parameters:
ECHO.
ECHO -HOST [num_of_players]   - Start a multiplayer game
ECHO -FILE [wad_filename(s)]  - Launch game with custom WADs
ECHO -IWAD [iwad_filename]    - Start game with specified IWAD
ECHO -WARP [level_#]          - Warp to level at startup, in DOOM1: E#M#, DOOM2: MAP##
ECHO -DEATHMATCH              - Start game in deathmatch mode
ECHO.
ECHO Current DIR is %DOOMDIR%
ECHO DOOM port to run: %ZPORT%
ECHO.
SET /P CUSTOMline=Command line parameters: 
ECHO Launching %ZPORT% %CUSTOMline% -IWAD %mainIWAD% ...
START %ZPORT% %CUSTOMline% -IWAD %mainIWAD%
GOTO MENU

:CHANGEIWAD
CLS
ECHO  CHANGE MAIN IWAD
ECHO ==================
ECHO.
ECHO Current IWAD set to launch automaticly: %mainIWAD%
ECHO.
ECHO 0 - None
ECHO 1 - DOOM.WAD
ECHO 2 - DOOM2.WAD
ECHO 3 - FREEDOOM1.WAD
ECHO 4 - FREEDOOM2.WAD
ECHO 5 - FREEDM.WAD
ECHO 6 - HERETIC.WAD
ECHO 7 - HEXEN.WAD
ECHO 8 - CHEX3.WAD
ECHO 9 - SQUARE1.PK3
CHOICE /C 0123456789 /N /M "Select IWAD to start with "
IF %ERRORLEVEL%==1 SET mainIWAD=None (use ZDOOM bootloader)
IF %ERRORLEVEL%==2 SET mainIWAD=DOOM.WAD
IF %ERRORLEVEL%==3 SET mainIWAD=DOOM2.WAD
IF %ERRORLEVEL%==4 SET mainIWAD=FREEDOOM1.WAD
IF %ERRORLEVEL%==5 SET mainIWAD=FREEDOOM2.WAD
IF %ERRORLEVEL%==6 SET mainIWAD=FREEDM.WAD
IF %ERRORLEVEL%==7 SET mainIWAD=HERETIC.WAD
IF %ERRORLEVEL%==8 SET mainIWAD=HEXEN.WAD
IF %ERRORLEVEL%==9 SET mainIWAD=CHEX3.WAD
IF %ERRORLEVEL%==10 SET mainIWAD=SQUARE1.PK3
GOTO MENU

:CHANGEEXEC
CLS
ECHO  CHANGE DOOM SOURCE PORT EXECUTABLE
ECHO ====================================
ECHO.
ECHO Current DOOM port set to launch: %ZPORT%
ECHO.
ECHO 1 - ZDOOM
ECHO 2 - LZDOOM
ECHO 3 - GZDOOM
ECHO 3 - Custom...
ECHO 4 - Back
CHOICE /C 12345 /N /M "Select number"
IF %ERRORLEVEL%==1 SET ZPORT=ZDOOM.EXE
IF %ERRORLEVEL%==2 SET ZPORT=LZDOOM.EXE
IF %ERRORLEVEL%==3 SET ZPORT=GZDOOM.EXE
IF %ERRORLEVEL%==4 SET /P ZPORT=Type the path to custom .EXE (current folder is %DOOMDIR%): 
IF %ERRORLEVEL%==5 GOTO MENU
GOTO MENU

:DOOMDIRFAIL
ECHO Folder specified in DOOMDIR does not exist, please edit this .BAT and change your DOOMDIR
ECHO Launcher will terminate
PAUSE

:EXIT
ECHO ZDOOM launcher by LeonardoTheMutant