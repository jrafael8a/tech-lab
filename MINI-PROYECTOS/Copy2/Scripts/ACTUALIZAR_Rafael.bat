@echo off
del Log_Copy2Servers.log
echo %date%  -  %time% 					>> Log_Copy2Servers.log

for /f "delims=*" %%a in ('type IPServers.txt') do (
echo %%a						>> Log_Copy2Servers.log
xcopy Copy2Servers\SVI "\\%%a\SVI$" /E /C /K /Y 	>> Log_Copy2Servers.log
echo. 							>> Log_Copy2Servers.log
echo. 							>> Log_Copy2Servers.log
)

start Log_Copy2Servers.log
exit