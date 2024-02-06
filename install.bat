@echo off
setlocal enabledelayedexpansion
set "filept=%~f0"
del "ClientAppSettings.json"
curl -s "https://raw.githubusercontent.com/NoMoreDg/RBXflags/main/ClientAppSettings.json" >> ClientAppSettings.json
timeout /t 2 >nul
:start
for /d %%i in ("%localappdata%\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set "folder=%%i"
        goto :NextStep ) else goto :start )
for /d %%i in ("C:\Program Files (x86)\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep ) else goto :start )
for /d %%i in ("C:\Program Files\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep ) else goto :start )
:NextStep
if exist "%folder%\ClientSettings\ClientAppSettings.json" (
	echo msgbox "Json file is already installed!   		%folder%" > %tmp%\tmp.vbs
	cscript /nologo %tmp%\tmp.vbs
	del %tmp%\tmp.vbs && exit
) else if exist "%folder%\ClientSettings" ( copy ClientAppSettings.json "%folder%\ClientSettings" ) else ( md "%folder%\ClientSettings" && copy ClientAppSettings.json "%folder%\ClientSettings" )
if exist "%folder%\ClientSettings\ClientAppSettings.json" (
	echo msgbox "Json file installed!   		%folder%" > %tmp%\tmp.vbs
	cscript /nologo %tmp%\tmp.vbs
	del %tmp%\tmp.vbs && exit ) else (
	echo msgbox "Error!   		%folder%" > %tmp%\tmp.vbs
	cscript /nologo %tmp%\tmp.vbs
	del %tmp%\tmp.vbs && exit )