@echo off
setlocal enabledelayedexpansion
Color F0
cls
echo.
echo A continuacion va a Borrar un archivo de las Comandas
echo de todos los Puntos de Venta (\\COMANDA\)
echo.
echo Por favor escriba el nombre del archivo que desea borrar
echo (incluyendo la extencion)
echo.
echo.
set /p NombDel=

for /f "delims=*" %%a in ('type IPPos.txt') do (
start /MIN rd /s /q "\\%%a\%NombDel%"
)

timeout /t 10 /nobreak
msg %username% "Del2Pos ha Terminado"
taskkill /F /IM cmd.exe
exit