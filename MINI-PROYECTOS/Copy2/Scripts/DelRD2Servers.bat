@echo off
setlocal enabledelayedexpansion
Color F0
cls
echo.
echo A continuacion va a Borrar un directorio de los Servidores
echo de todos los Servers (\\SERVER\)
echo.
echo Por favor escriba el nombre de la carpeta que desea borrar
echo.
set /p NombDir=

for /f "delims=*" %%a in ('type IPServers.txt') do (
start /MIN rd /s /q "\\%%a\%NombDir%"
)
timeout /t 7 /nobreak
msg %username% "Del2ServersFolder ha Terminado"
taskkill /F /IM cmd.exe
exit