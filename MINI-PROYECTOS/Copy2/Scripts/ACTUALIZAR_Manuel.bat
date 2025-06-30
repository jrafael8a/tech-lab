@echo off
for /f "delims=*" %%a in ('type IPServersManuel.txt') do (
start /MIN xcopy Copy2Servers\SVI "\\%%a\SVI$" /E /C /K /Y
)

XCopy /y E:\MODULOS \\10.10.123.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.123.31\sky_upd\Escritorio
XCopy /y E:\MODULOS \\10.10.124.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.124.31\sky_upd\Escritorio
XCopy /y E:\MODULOS \\10.10.134.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.134.31\sky_upd\Escritorio
XCopy /y E:\MODULOS \\10.10.144.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.144.31\sky_upd\Escritorio
XCopy /y E:\MODULOS \\10.10.160.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.160.31\sky_upd\Escritorio
XCopy /y E:\MODULOS \\10.10.163.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.163.31\sky_upd\Escritorio
XCopy /y E:\MODULOS \\10.10.165.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.165.31\sky_upd\Escritorio
XCopy /y E:\MODULOS \\10.10.172.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.172.31\sky_upd\Escritorio
XCopy /y E:\MODULOS \\10.10.175.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.175.31\sky_upd\Escritorio
XCopy /y E:\MODULOS \\10.10.179.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.179.31\sky_upd\Escritorio
XCopy /y E:\MODULOS \\10.10.181.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.181.31\sky_upd\Escritorio
XCopy /y E:\MODULOS \\10.10.186.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.186.31\sky_upd\Escritorio
XCopy /y E:\MODULOS \\10.10.188.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.188.31\sky_upd\Escritorio
XCopy /y E:\MODULOS \\10.10.190.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.190.31\sky_upd\Escritorio

msg %username% "Copy2Servers Manuel ha Terminado"
taskkill /F /IM cmd.exe

Exit