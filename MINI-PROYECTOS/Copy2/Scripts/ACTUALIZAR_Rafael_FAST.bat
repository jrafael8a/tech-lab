@echo off
del Log_Copy2Servers.log
echo %date%  -  %time% 					>> Log_Copy2Servers.log

for /f "delims=*" %%a in ('type IPServers.txt') do (
start /MIN xcopy Copy2Servers\SVI "\\%%a\SVI$" /E /C /K /Y
)

timeout /t 60 /nobreak
REM msg %username% "Copy2Servers FAST ha Terminado"
taskkill /F /IM cmd.exe

exit