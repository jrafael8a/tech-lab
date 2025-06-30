@echo off
REM IP SERVER y TIPO de MAQUINA
	set /p IPServer=<%cd%\ip.txt
	set /p TipoPC=<%cd%\tipo.txt

REM Documenta la Fecha y Hora a un archivo de LOG
	echo ------------------------- 							>> %cd%\copy2log.log
	echo %date%  -  %time% 									>> %cd%\copy2log.log

REM Llama la carpeta SHR8 del servidor y copia todos sus archivos
	xcopy "\\%IPserver%\SVI$\SHR8" "C:\SHR8\" /E /C /Y 		>> %cd%\copy2log.log

REM Ejecuta el fichero que copia un acceso directo a shell:startup
REM 	xcopy "%cd%\Copy2.lnk" "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\" /E /C /K /Y		>> %cd%\copy2log.log

REM Si es una Buena TV o AKI se salta todo el proceso de copia de DLLs
	IF %TipoPC%==BTV (goto :BTV)
	IF %TipoPC%==AKI (goto :AKI)

REM Copia la carpeta DESKTOP 
	xcopy "\\%IPserver%\SVI$\Desktop" "%UserProfile%\Desktop\" /E /C /Y 																>> %cd%\copy2log.log

REM Copiando la carpeta DESKTOP segun el tipo de maquina
	IF %TipoPC%==Facturas (xcopy "\\%IPserver%\SVI$\Desktop_Facturas" "%UserProfile%\Desktop\" /E /C /Y 		>> %cd%\copy2log.log)
	IF %TipoPC%==Envios (xcopy "\\%IPserver%\SVI$\Desktop_Envios" "%UserProfile%\Desktop\" /E /C /Y 			>> %cd%\copy2log.log)
	IF %TipoPC%==Comanda (xcopy "\\%IPserver%\SVI$\Desktop_Comanda" "%UserProfile%\Desktop\" /E /C /Y 			>> %cd%\copy2log.log)
	

:BTV
REM IF %TipoPC%==BTV (start xcopy "\\%IPserver%\SVI$\TVBUENA" "C:\TVBUENA" /E /C /Y)
REM IF %TipoPC%==BTV (start xcopy "\\%IPserver%\SVI$\Z" "C:\Z" /E /C /Y)
REM IF %TipoPC%==BTV (start xcopy "\\%IPserver%\SVI$\Desktop_BTV" "%UserProfile%\Desktop\" /E /C /Y)

goto :FIN


:AKI
REM Comandos para PC de AKI aqui

goto :FIN


:FIN
REM EJECUTA un archivo con comandos eventuales
	%cd%\cmd.vbs

REM Limpia la carpeta TMP cada 5 dias
	IF %Date:~5,2%==05 (%cd%\ClearTMP.vbs)
	IF %Date:~5,2%==10 (%cd%\ClearTMP.vbs)
	IF %Date:~5,2%==15 (%cd%\ClearTMP.vbs)
	IF %Date:~5,2%==20 (%cd%\ClearTMP.vbs)
	IF %Date:~5,2%==25 (%cd%\ClearTMP.vbs)
	IF %Date:~5,2%==30 (%cd%\ClearTMP.vbs)

REM Copy2 by MasterEight 2024 all right reserved
Exit