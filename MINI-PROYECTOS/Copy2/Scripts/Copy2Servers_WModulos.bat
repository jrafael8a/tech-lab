@echo off
setlocal enabledelayedexpansion
del Log_Copy2Servers.log
REM echo -------------------------------------------------- 	>> Log_Copy2Servers.log
echo %date%  -  %time% 						>> Log_Copy2Servers.log

for /f "delims=*" %%a in ('type IPServers.txt') do (
echo %%a							>> Log_Copy2Servers.log
echo MODULOS 	 						>> Log_Copy2Servers.log
xcopy Copy2Servers\Modulos "\\%%a\Modulos" /E /C /K /Y 		>> Log_Copy2Servers.log
echo SVI	 						>> Log_Copy2Servers.log
xcopy Copy2Servers\SVI "\\%%a\SVI$" /E /C /K /Y 		>> Log_Copy2Servers.log
echo. 								>> Log_Copy2Servers.log
echo. 								>> Log_Copy2Servers.log
)

exit