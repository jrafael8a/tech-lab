@echo on
setlocal enabledelayedexpansion
Color F0
set NombDel=ITVASPORT$\DTE

for /f "delims=*" %%a in ('type IPPOS.txt') do (
start cmd /c "set NombDel=%NombreDel% & set a=%%a & IF EXIST '\\%%a\%NombDel%' (echo '\\%%a\   -   SI' >> '%dir%\TEMP\%%a-SI.log') ELSE (echo '\\%%a\   -   NO EXISTE'>> '%cd%\TEMP\%%a-NO.log') & pause"
)
pause
exit