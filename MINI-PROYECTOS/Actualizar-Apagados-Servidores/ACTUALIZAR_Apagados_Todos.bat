@echo off
for /f "delims=*" %%a in ('type IPServersTodos.txt') do (
start /MIN xcopy Apagado "\\%%a\SVI$\Apagado" /E /C /K /Y
)

timeout /t 180 /nobreak
msg %username% "Actualizar Apagados -a Todos- ha Terminado"
taskkill /F /IM cmd.exe

exit