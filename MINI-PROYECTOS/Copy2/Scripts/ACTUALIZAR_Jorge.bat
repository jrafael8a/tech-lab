@echo off

for /f "delims=*" %%a in ('type IPServersJorge.txt') do (
start /MIN xcopy Copy2Servers\SVI "\\%%a\SVI$" /E /C /K /Y
)

XCopy /y E:\MODULOS \\10.10.128.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.128.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.132.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.132.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.138.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.138.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.135.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.135.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.140.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.140.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.2.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.2.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.146.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.146.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.155.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.155.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.152.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.152.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.159.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.159.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.173.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.173.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.176.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.176.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.177.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.177.31\sky_upd\Escritorio

XCopy /y E:\MODULOS \\10.10.185.31\Modulos
XCopy /y E:\ESCRITORIO \\10.10.185.31\sky_upd\Escritorio

msg %username% "Copy2Servers Jorge ha Terminado"
taskkill /F /IM cmd.exe

Exit