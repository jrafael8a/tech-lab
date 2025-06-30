@echo off
setlocal enabledelayedexpansion
Color F0
del CheckFactFiles.log
set contador=1
set repeticiones=3
echo %date%  -  %time% >> CheckFactFiles.log

cls
echo.
echo A continuacion va a Verificar la existencia de un archivo o carpeta
echo en todas las Maquinas de Facturas (\\FACTURAS\)
echo.
echo Por favor escriba el nombre del archivo que desea comprobar su existencia
echo (incluyendo la extencion y ruta completa dentro de la PC)
echo.
set /p NombDel=
echo.
echo Espere por favor mientras verificamos la existencia de dicho archivo o carpeta

:VerificarExistencia

	cls.
	echo.
	echo "Comprobando la existencia de: \\FACTURAS\%NombDel%"
	echo.
	echo -----------------------------------------------------------
	echo.

	echo. >> CheckFactFiles.log
	echo "Comprobando la existencia de: \\FACTURAS\%NombDel%" 	 >> CheckFactFiles.log
	echo. >> CheckFactFiles.log
	echo ----------------------------------------------------------- >> CheckFactFiles.log
	echo. >> CheckFactFiles.log

	for /f "delims=*" %%a in ('type IPFacturas.txt') do (
		echo \\%%a\ >> CheckFactFiles.log
		echo. >> CheckFactFiles.log
		
		echo \\%%a\
		echo.
		
		for /l %%i in (1,1,%repeticiones%) do (
			set "output="
			for /f "delims=" %%b in ('ping -n 1 -w 5000 %%a') do set "output=!output!%%b"
			echo !output! | findstr /C:"TTL" >nul 2>nul
			if !errorlevel! equ 0 (
				IF EXIST \\%%a\%NombDel% (
					DIR /T:W "\\%%a\%NombDel%" | find "/" >> CheckFactFiles.log
					DIR /T:W "\\%%a\%NombDel%" | find "/"
				) ELSE (
					echo NO EXISTE >> CheckFactFiles.log
					echo NO EXISTE 
				)
			) else (
				echo Ping No Responde >> CheckFactFiles.log
				echo Ping No Responde
			)
			echo. >> CheckFactFiles.log
			echo.
		)
		echo. >> CheckFactFiles.log
		echo ----------------------------------------------------------- >> CheckFactFiles.log
		echo. >> CheckFactFiles.log
		echo.
		echo -----------------------------------------------------------
		echo.
	)

	echo. >> CheckFactFiles.log
	echo %date%  -  %time% >> CheckFactFiles.log
	
start CheckFactFiles.log
exit