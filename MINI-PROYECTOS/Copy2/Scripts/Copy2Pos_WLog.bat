@echo off
setlocal enabledelayedexpansion
del Log_Copy2POS.log
echo %date%  -  %time% >> Log_Copy2POS.log

for /f "delims=*" %%a in ('type IPPos.txt') do (
echo %%a 						>> Log_Copy2POS.log
xcopy Copy2Servers\SVI\SHR8 "\\%%a\shr8$" /E /C /K /Y	>> Log_Copy2POS.log
echo. >> Log_Copy2POS.log
echo. >> Log_Copy2POS.log
)

start Log_Copy2POS.log
exit