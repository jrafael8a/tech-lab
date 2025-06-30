@echo off
Mode 100,20
Color F0
:inicio
cls
echo.	
echo 		Que desea Hacer? 
echo.	
echo 	1 - UPDATE 	- Actualizar archivos o carpetas
echo 	2 - CHECK 	- Verificar la existencia de un archivo o carpeta
echo 	3 - DELETE 	- Borrar un archivo o carpeta
echo.
echo 	0 - Salir
echo.
set /p resp1=

if %resp1% == C (goto :consola)
if %resp1% == c (goto :consola)
if %resp1% == 1 (goto :Actualizar)
if %resp1% == 2 (goto :Verificar)
if %resp1% == 3 (goto :Eliminar)

if %resp1% == 0 (goto :salir)
goto :inicio

:consola
start cmd.exe
goto :inicio


:Actualizar
cls
echo 		Que desea Actualizar? 
echo.	
echo 	1 - SERVERS 	- Actualizar MIS SERVIDORES asignados
echo 	2 - Servers	- Actualizar los servidores de ALGUIEN MAS
echo 	3 - SeversWM 	- Actualizar MIS SERVIDORES asignados (mas carpeta Modulos)
echo 	4 - POS_LOG 	- Actualizar todas las comandas (generar archivo de log)
echo 	5 - POS_FAST	- Actualizar todas las comandas (fast mode)
echo 	8 - SERVER_FAST	- Actualizar MIS SERVIDORES (fast mode)


echo.
echo 	9 - Menu Anterior
echo 	0 - Salir
echo.
set /p resp2=

if %resp2% == 1 (goto :UpdateMyServers)
if %resp2% == 2 (goto :UpdateAllServers)
if %resp2% == 3 (goto :UpdateMyServersWM)
if %resp2% == 4 (goto :UpdatePosLog)
if %resp2% == 5 (goto :UpdatePosFast)
if %resp2% == 8 (goto :UpdateMyServersFast)


if %resp2% == 9 (goto :inicio)
if %resp2% == 0 (goto :salir)
goto :Actualizar

:UpdateMyServers
Scripts\ACTUALIZAR_Rafael.bat

:UpdateMyServersFast
Scripts\Actualizar_Rafael_Fast.bat

:UpdateAllServers
cls
echo 		Los servidores de quien desea Actualizar? 
echo.
echo 	1 - Rafael
echo 	2 - Manuel
echo 	3 - Jorge
echo 	4 - Noe
echo 	5 - Chema
echo.
echo 	8 - Apagado Todos
echo. 	9 - Menu Anterior
echo 	0 - Salir
echo.
set /p resp3=

if %resp3% == 1 Scripts\Actualizar_Rafael_Fast.bat
if %resp3% == 2 Scripts\Actualizar_Manuel.bat
if %resp3% == 3 Scripts\Actualizar_Jorge.bat
if %resp3% == 4 Scripts\Actualizar_Noe.bat
if %resp3% == 5 Scripts\Actualizar_Chema.bat
if %resp3% == 8 Scripts\ACTUALIZAR_Apagados_FAST.bat


if %resp3% == 9 (goto :Actualizar)
if %resp3% == 0 (goto :salir)
goto :Actualizar

:UpdateMyServersWM
Scripts\Copy2Servers_WModulos.bat
goto :inicio

:UpdatePosLog
Scripts\Copy2Pos_WLog.bat
goto :inicio

:UpdatePosFast
Scripts\Copy2Pos_Fast.bat
goto :inicio


:Verificar
cls
echo 		Verificar la existencia de archivos o carpetas en: 
echo.	
echo 	1 - Maquinas de Facturas.
echo 	2 - Maquinas de Facturas (con Fecha y tamaño)
echo 	3 - Todas las comandas
echo 	4 - Todas las comandas (con Fecha y tamaño)
echo 	5 - Mis Servidores
echo 	6 - Mis Servidores (con Fecha y tamaño)

echo.
echo. 	9 - Menu Anterior
echo 	0 - Salir
echo.
set /p resp4=

if %resp4% == 1 (goto :CheckFact)
if %resp4% == 2 (goto :CheckFactDate)
if %resp4% == 3 (goto :CheckPos)
if %resp4% == 4 (goto :CheckPosDate)
if %resp4% == 5 (goto :CheckServers)
if %resp4% == 6 (goto :CheckServersDate)


if %resp4% == 9 (goto :inicio)
if %resp4% == 0 (goto :salir)
goto :Verificar

:CheckFact
Scripts\Check2Fact.bat
goto :inicio

:CheckFactDate
Scripts\Check2FactDate.bat
goto :inicio

:CheckPos
Scripts\Check2Pos.bat
goto :inicio

:CheckPosDate
Scripts\Check2PosDate.bat
goto :inicio

:CheckServers
Scripts\Check2Servers.bat
goto :inicio

:CheckServersDate
Scripts\Check2ServersDate.bat
goto :inicio




:Eliminar
cls
echo 		Seleccione de donde va a eliminar los archivos o carpetas: 
echo.	
echo 	1 - DEL	POS 	- Borrar de todas las Comandas (especial para archivos)
echo 	2 - RD 	POS	- Borrar de todas las Comandas (especial para carpetas)
echo 	3 - DEL	SERVERS	- Borrar de los servidores (especial para archivos)
echo 	4 - RD	SERVERS	- Borrar de los servidores (especial para carpetas)

echo.
echo. 	9 - Menu Anterior
echo 	0 - Salir
echo.
set /p resp5=

if %resp5% == 1 (goto :DelPOS)
if %resp5% == 2 (goto :RDPOS)
if %resp5% == 3 (goto :DelServers)
if %resp5% == 4 (goto :RDServers)

if %resp5% == 9 (goto :inicio)
if %resp5% == 0 (goto :salir)
goto :Eliminar

:DelPOS
Scripts\Del2POS.bat
goto :inicio

:RDPOS
Scripts\DelRD2POS.bat
goto :inicio

:DelServers
Scripts\Del2Servers.bat
goto :inicio

:RDServers
Scripts\DelRD2Servers.bat
goto :inicio


:salir
exit