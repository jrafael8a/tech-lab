@echo off
setlocal
set "URL=http://10.4.0.9:8080/bc240"
set "NOMBRE=BC240"
set "EDGE_PATH=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"

if not exist "%EDGE_PATH%" (
    set "EDGE_PATH=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"
)

if not exist "%EDGE_PATH%" (
    echo Edge no esta instalado. Abortando.
    exit /b
)

REM Creamos acceso directo en escritorio
echo Set oWS = CreateObject("WScript.Shell") > CrearAcceso.vbs
echo sLinkFile = oWS.SpecialFolders("Desktop") ^& "\%NOMBRE%.lnk" >> CrearAcceso.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CrearAcceso.vbs
echo oLink.TargetPath = "%EDGE_PATH%" >> CrearAcceso.vbs
echo oLink.Arguments = "--app=%URL%" >> CrearAcceso.vbs
echo oLink.IconLocation = "%SystemDrive%\SHR8\Icons\BC.ico,0" >> CrearAcceso.vbs
echo oLink.Save >> CrearAcceso.vbs

cscript //nologo CrearAcceso.vbs
del CrearAcceso.vbs

echo Acceso directo creado en el escritorio.
endlocal
exit /b