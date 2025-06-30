@echo on
setlocal enabledelayedexpansion
for /f "delims=*" %%a in ('type IPPos.txt') do (
start /MIN xcopy Copy2Servers\SVI\SHR8 "\\%%a\shr8$" /E /C /K /Y
)
msg %username% "Copy2POS ha Terminado"
taskkill /F /IM cmd.exe
exit