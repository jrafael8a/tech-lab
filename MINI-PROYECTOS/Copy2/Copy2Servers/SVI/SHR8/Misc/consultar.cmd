@echo off
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Hostname"
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\CachedMachineNames" /v "NameUserPrincipal"

echo.
echo.
echo      Desea buscar en todo el registro?
echo          1-SI         2-NO
set /p resp=
if %resp% == 1 (goto :buscar)
exit

:buscar
echo.
echo.
echo Buscando "EnviosB12" en todo el registro HKLM...
reg query HKLM /s /f "EnviosB12"

pause
exit