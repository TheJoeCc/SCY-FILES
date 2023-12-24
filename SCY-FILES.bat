@echo off
attrib +s +h pass.txt
REM By: TheJoeCc
color 03
cd "C:\Users\%username%\Desktop"
md FILES
cls
IF EXIST pass.txt (
       goto :bucle
   ) ELSE (
       goto :crear
   )

:crear
color 03
echo.
echo.   Fecha: %DATE%  Hora: %TIME%
echo. ========================================
echo. =  LE DAMOS LA BIENVENIDA A SCY-FILES  =
echo. ========================================
echo.
echo. Vamos a crear una nueva carpeta secreta con el nombre "FILES"
echo. Dentro de la carpeta FILES puede guardar los archivos que quiera.
echo.

:respass
color 03
set /p pass1=" Ingrese su nueva clave: "
set /p pass2=" Repita su nueva clave: "

if "%pass1%"=="%pass2%" goto :sucess (
   ) ELSE (
       goto :fail
   )
pause

:sucess
set "filepath1=C:\Users\%username%\Desktop\pass.txt"
echo %pass1%> %filepath1%
echo.
echo Recuerde muy bien su clave: %pass1%
attrib +s +h pass.txt
echo.
pause
goto :bucle

:fail
color 0c
cls
echo. Las claves deben de coincidir, intentalo nuevamente.
pause
cls
echo.
goto :crear

:bucle
cls
color 03
::imagen ASCII
title By: JCC
echo.
echo. .dP"Y8  dP""b8 Yb  dP          888888 88 88     888888 .dP"Y8 
echo. `Ybo." dP   `"  YbdP  ________ 88__   88 88     88__   `Ybo." 
echo. o.`Y8b Yb        8P   """""""" 88""   88 88  .o 88""   o.`Y8b 
echo. 8bodP'  YboodP  dP             88     88 88ood8 888888 8bodP' 
echo.
setlocal

set "ruta=C:\Users\%username%\Desktop\pass.txt"
for /f "usebackq delims=" %%i in ("%ruta%") do set "content=%%i"
set /p "key=Ingrese su clave: "
if "%key%"=="%content%" goto :acceso

:error
cls
color 0c
echo. Ingresaste una clave incorrecta, intenta nuevamente.
pause >nul
goto :bucle

:acceso
color 03
cls
echo.
::menu
echo. Fecha: %DATE%  Hora: %TIME%
echo. ===================================
echo. (1) --- Ocultar la carpeta
echo. (2) --- Mostrar la carpeta
echo. (3) --- Cambiar clave de acceso
echo. ===================================
echo.
echo. (Ingrese "99" para volver) 
set /p opc="Ingrese lo que desea hacer (1-3): "

if "%opc%"=="1" goto :op1
if "%opc%"=="2" goto :op2
if "%opc%"=="3" goto :respass2
if "%opc%"=="99" goto :bucle
cls
color 0c
echo. "%opc%" no es valor valido, por favor intenta nuevamente
echo.
pause
echo.
goto:acceso

:op1
attrib +s +h FILES
cls
echo.
echo. =========================================
echo. =   SU CARPETA AHORA PERMANECE OCULTA   =
echo. =========================================
echo.
pause
goto :acceso

:op2
cls
attrib -s -h FILES
echo.
echo. =========================================
echo. =       SU CARPETA FUE RESTAURADA       =
echo. =========================================
echo.
pause
goto :acceso

:respass2
color 03
cls
set /p npass1="Ingrese su nueva clave: "
set /p npass2="Repita su nueva clave: "
if "%npass1%"=="%npass2%" goto :sucess2

:fail2
color 0c
cls
echo. Las claves deben coincidir, intenta nuevamente.
pause
cls
echo.
goto :respass2

:sucess2
set "filepath=C:\Users\%username%\Desktop\pass.txt"
attrib -s -h pass.txt
echo %npass1%> %filepath%
attrib +s +h pass.txt
::confirmar
echo.
echo. Su clave fue actualizada en la ruta: %filepath%
echo.
pause
goto :acceso