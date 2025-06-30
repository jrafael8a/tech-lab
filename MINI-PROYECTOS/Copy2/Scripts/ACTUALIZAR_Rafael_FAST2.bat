@echo on
REM setlocal enabledelayedexpansion
set "carpeta=TmpLog"
set "archivoConsolidado=FastLog.log"
type nul> "%archivoConsolidado%"

rd TmpLog
mkdir TmpLog
echo %date%  -  %time% 					>> TmpLog\0_Date.log

for /f "delims=*" %%a in ('type IPServers.txt') do (
start xcopy Copy2Servers\SVI "\\%%a\SVI$" /E /C /K /Y >> "TmpLog\%%a.log"
)
REM msg %username% "Copy2Servers FAST ha Terminado"
REM taskkill /F /IM cmd.exe

for %%I in ("%carpeta%\*") do (
    REM Agregar el nombre del archivo al archivo consolidado
    echo Archivo: %%~nxI >> "%archivoConsolidado%"
    REM Agregar el contenido del archivo al archivo consolidado
    type "%%I" >> "%archivoConsolidado%"
    echo. >> "%archivoConsolidado%"
)

echo Proceso completado.

pause

exit