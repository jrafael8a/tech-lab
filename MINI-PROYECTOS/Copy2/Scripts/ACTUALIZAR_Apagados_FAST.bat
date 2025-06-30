@echo off
REM del Log_Copy2ApagadoTodos.log
REM echo %date%  -  %time% 					>> Log_Copy2ApagadoTodos.log

for /f "delims=*" %%a in ('type IPServersTodos.txt') do (
start /MIN xcopy Copy2Servers\SVI\Apagado "\\%%a\SVI$\Apagado" /E /C /K /Y
)

timeout /t 60 /nobreak
REM msg %username% "Copy2ApagadoTodos FAST ha Terminado"
taskkill /F /IM cmd.exe

exit