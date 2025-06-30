@echo off

for /f "delims=*" %%a in ('type IPServersChema.txt') do (
start /MIN xcopy Copy2Servers\SVI "\\%%a\SVI$" /E /C /K /Y
)

XCopy /y E:\MODULOS \\10.10.129.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.129.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.131.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.131.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.130.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.130.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.127.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.127.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.141.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.141.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.143.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.143.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.145.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.145.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.147.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.147.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.148.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.148.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.151.41\Modulos
XCopy /y E:\ESCRITORIO \\10.10.151.41\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.164.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.164.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.180.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.180.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.183.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.183.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.184.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.184.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.196.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.196.31\sky_upd\Escritorio


msg %username% "Copy2Servers Chema ha Terminado"
taskkill /F /IM cmd.exe

Exit