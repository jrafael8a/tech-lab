@echo off
REM Cierra los procesos de NAV, Facturacion (y Buena TV si procede)

taskkill /F /IM Microsoft.Dynamics.Nav.Client.x86.exe
taskkill /F /IM Microsoft.Dynamics.Nav.Client.exe
taskkill /F /IM InvoicePrint.exe
REM taskkill /F /IM BuenaTV.exe

REM Borra el archivo de log cada 17 de mes
IF %Date:~5,2%==17 (del %cd%\copy2log.log)

REM msg %username% "NAV KILL EJECUTADO CORRECTAMENTE"
exit