@echo off
setlocal enabledelayedexpansion
Color F0
del CheckServersFiles.log
set contador=1
set repeticiones=2
echo %date%  -  %time% >> CheckServersFiles.log

cls
echo.
echo A continuacion va a Verificar la existencia de un archivo de la Carpeta SVI
echo de todos los Servers (\\SERVER\)
echo.
echo Por favor escriba el nombre del archivo que desea comprobar su existencia
echo (incluyendo la extencion y ruta completa dentro del server)
echo.
set /p NombDel=
echo.
echo Espere por favor mientras verificamos la existencia de dicho archivo o carpeta

:VerificarExistencia
	cls
	echo.
	echo Comprobando la existencia de: \\SERVER\%NombDel%
	echo.
	echo -----------------------------------------------------------
	echo.

	echo. >> CheckServersFiles.log
	echo Comprobando la existencia de: \\SERVER\%NombDel% 	 >> CheckServersFiles.log
	echo. >> CheckServersFiles.log
	echo ----------------------------------------------------------- >> CheckServersFiles.log
	echo. >> CheckServersFiles.log

	for /f "delims=*" %%a in ('type IPServers.txt') do (
		echo \\%%a\ >> CheckServersFiles.log
		echo. >> CheckServersFiles.log
		
		echo \\%%a\
		echo.
		
		for /l %%i in (1,1,%repeticiones%) do (
			set "output="
			for /f "delims=" %%b in ('ping -n 1 -w 5000 %%a') do set "output=!output!%%b"
			echo !output! | findstr /C:"TTL" >nul 2>nul
			if !errorlevel! equ 0 (
				IF EXIST "\\%%a\%NombDel%" (
					echo SI >> CheckServersFiles.log
					echo SI
				) ELSE (
					echo NO EXISTE >> CheckServersFiles.log
					echo NO EXISTE
				)
			) else (
				echo Ping No Responde >> CheckServersFiles.log
				echo Ping No Responde
			)
		)
		echo. >> CheckServersFiles.log
		echo ----------------------------------------------------------- >> CheckFactFiles.log
		echo. >> CheckServersFiles.log
		echo.
		echo -----------------------------------------------------------
		echo.
	)

	echo. >> CheckFactFiles.log
	echo %date%  -  %time% >> CheckFactFiles.log
	
start CheckServersFiles.log
exit