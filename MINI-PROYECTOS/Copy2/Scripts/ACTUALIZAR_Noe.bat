@echo off

for /f "delims=*" %%a in ('type IPServersNoe.txt') do (
start /MIN xcopy Copy2Servers\SVI "\\%%a\SVI$" /E /C /K /Y
)

XCopy /y D:\MODULOS \\10.10.122.31\Modulos
XCopy /y D:\ESCRITORIO \\10.10.122.31\sky_upd\Escritorio

XCopy /y D:\MODULOS \\10.10.4.31\Modulos
XCopy /y D:\ESCRITORIO \\10.10.4.31\sky_upd\Escritorio

XCopy /y D:\MODULOS \\10.10.136.31\Modulos
XCopy /y D:\ESCRITORIO \\10.10.136.31\sky_upd\Escritorio

XCopy /y D:\MODULOS \\10.10.150.31\Modulos
XCopy /y D:\ESCRITORIO \\10.10.150.31\sky_upd\Escritorio

XCopy /y D:\MODULOS \\10.10.154.41\Modulos
XCopy /y D:\ESCRITORIO \\10.10.154.41\sky_upd\Escritorio

XCopy /y D:\MODULOS \\10.10.158.31\Modulos
XCopy /y D:\ESCRITORIO \\10.10.158.31\sky_upd\Escritorio

XCopy /y D:\MODULOS \\10.10.161.31\Modulos
XCopy /y D:\ESCRITORIO \\10.10.161.31\sky_upd\Escritorio

XCopy /y D:\MODULOS \\10.10.162.31\Modulos
XCopy /y D:\ESCRITORIO \\10.10.162.31\sky_upd\Escritorio

XCopy /y D:\MODULOS \\10.10.167.31\Modulos
XCopy /y D:\ESCRITORIO \\10.10.167.31\sky_upd\Escritorio

XCopy /y D:\MODULOS \\10.10.168.31\Modulos
XCopy /y D:\ESCRITORIO \\10.10.168.31\sky_upd\Escritorio

XCopy /y D:\MODULOS \\10.10.169.31\Modulos
XCopy /y D:\ESCRITORIO \\10.10.169.31\sky_upd\Escritorio

XCopy /y D:\MODULOS \\10.10.171.31\Modulos
XCopy /y D:\ESCRITORIO \\10.10.171.31\sky_upd\Escritorio

XCopy /y D:\MODULOS \\10.10.174.31\Modulos
XCopy /y D:\ESCRITORIO \\10.10.174.31\sky_upd\Escritorio

XCopy /y D:\MODULOS \\10.10.182.31\Modulos
XCopy /y D:\ESCRITORIO \\10.10.182.31\sky_upd\Escritorio

XCopy /y D:\MODULOS \\10.10.191.31\Modulos
XCopy /y D:\ESCRITORIO \\10.10.191.31\sky_upd\Escritorio

XCopy /y D:\MODULOS \\10.10.7.31\Modulos
XCopy /y D:\ESCRITORIO \\10.10.7.31\sky_upd\Escritorio

msg %username% "Copy2Servers Noe ha Terminado"
taskkill /F /IM cmd.exe

Exit