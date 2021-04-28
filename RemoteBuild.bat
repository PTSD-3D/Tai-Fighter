@ECHO OFF
TITLE Remote Build
set gameName=TaiFighter

echo If you have your engine's build in another folder this is the program for you
echo If you don't have the engine in another folder, try out LocalBuild.bat
echo.

:choicePrompt
set /p choice="Do you want to build (B) or just copy the bin folder (C)? "
IF '%choice%'=='B' GOTO build
IF '%choice%'=='b' GOTO build
IF '%choice%'=='C' GOTO setRemoteFolder
IF '%choice%'=='C' GOTO setRemoteFolder
echo "%choice%" is not valid
echo.
GOTO choicePrompt

:build
echo building
set remFolder="C:\Users\Steve\Documents\GitHub\PTSD-Engine\bin"
GOTO copyFiles

:setRemoteFolder
echo. && echo Input the filepath for where your bin folder is
set /p remFolder="Example: for C:\User\PTSD-Engine\bin: "
GOTO copyFiles

:copyFiles
echo Copying engine files...
robocopy %remFolder% bin\ /s /e

echo Copying game files...
robocopy %gameName%\assets bin\assets /s /e /NFL /NDL /NJH /NJS /nc /ns /np
robocopy %gameName%\scripts bin\assets\scripts\Client /s /e /NFL /NDL /NJH /NJS /np