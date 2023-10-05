# Batch ZDOOM launcher
A simple game launcher for ZDOOM family of ports made in Batch

In practise you can run any DOOM source port with this launcher but it was specificaly designed for ZDOOM

## Configuration
In order to launch your ZDOOM port you have to specify your executable and DOOM gamefolder. By default it's set to `GZDOOM.EXE` and `C:\GAMES\ZDOOM` respectively but you can change those.
Files with ***.BAT** extension (batch file) is a regular text file which means you can freely open it in any text editor and edit it.
Right at the beginning there are 4 configuration variables that you can change, it should look like this:
```batch
SET DOOMDIR=C:\GAMES\ZDOOM
SET PWADDIR=%DOOMDIR%\WADS
SET mainIWAD=DOOM2.WAD
SET ZPORT=GZDOOM.EXE
```

- `DOOMDIR` - your DOOM gamefolder where executable is located;
- `PWADDIR` - your folder with ***.WAD*** files, `%DOOMDIR%` here means that the folder is set to `C:\GAMES\ZDOOM\WADS`;
- `mainIWAD` - the default game ***.WAD*** to select on launcher startup.
- `ZPORT` - name of the DOOM executable to use.
