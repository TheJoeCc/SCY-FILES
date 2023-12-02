@echo off
cd "C:\Users\%username%\Desktop"
md FILES
cls
echo. En la ventana del bloc de notas escriba la clave que usara para ocultar y/o mostrar su carpeta
IF EXIST pass.txt (
       goto :bucle
   ) ELSE (
       goto :crear
   )
:crear
type nul > pass.txt
notepad pass.txt
attrib +s +h pass.txt

:bucle
cls
color 0E
::imagen ASCII
title By: JCC
echo.
echo.          :~~~~~~~~~~~                                               
echo.          -G~~~~~~~~~^5J                                              
echo.          -G           G!                                             
echo.          -G           :G7!77!!!!!!777777777777!!!!!777777!.          
echo.          -G            .:::::::::::::::::::::::::::::::::5J          
echo.          -G                                              JY          
echo.          -G                   .~!!!!~.                   JJ          
echo.          -G                 :5??**??!Y:                  JJ          
echo.          -G                 57        G1                 JY          
echo.          -G                 G! ...... P7                 JY          
echo.          -G              7J7J?77777777J?7Y:              JY          
echo.          -G              P~     ~7!:     P!              JY          
echo.          -G              P~   :Y    G:   5!              JJ          
echo.          -G              P~    G    Y    5!              JJ          
echo.          -G              P~      J5      P!              JJ          
echo.          -G              P!              P!              JY          
echo.          -G              .??????-777-?????.              JY          
echo.          -G                                              JY          
echo.          -B::::::::::::::::::::::::::::::::::::::::::::::5J          
echo.           ~7777777777777777777777777777777777777777777777!. 
echo.

setlocal

set "filepath=C:\Users\%username%\Desktop\pass.txt"
for /f "usebackq delims=" %%i in ("%filepath%") do set "content=%%i"

set /p pass="Ingrese su clave: " 

if %pass%==%content% goto :acceso
::error de validacion
:error
cls
echo. Ingresaste una clave incorrecta, intentalo nuevamente.
pause>nul
goto :bucle
:acceso
cls
echo.
::menu
echo. Fecha: %DATE%  hora: %TIME%
echo. ---------------------------------
echo. (1) Ocultar la carpeta
echo. (2) Mostrar la carpeta
echo. (3) Cambiar clave de acceso
echo. --------------------------------- 
echo.
::seleccion de opciones
echo. (Ingrese "99" para volver) 
set /p opc="Seleccione una opcion (1-3): "
if %opc%==1 goto :op1
if %opc%==2 goto :op2
if %opc%==3 goto :op3
if %opc%==99 goto :bucle

:op1
attrib +s +h FILES
cls
echo.
echo. ------------------------------------------
echo.  Su carpeta ahora permanece oculta
echo. ------------------------------------------
echo.
pause
goto :acceso

:op2
cls
attrib -s -h FILES
echo.
echo. ------------------------------------------
echo.  Su carpeta fue restaurada
echo. ------------------------------------------
echo.
pause
goto :acceso

:op3
cls
::ruta donde se guardara la clave
set "filepath=C:\Users\%username%\Desktop\pass.txt"
:actualizar
::el usuario ingresa la nueva clave
attrib -s -h pass.txt
echo.
set /p newpass="Ingrese su nueva clave: "
set /p newpass2="Repita su nueva clave: "
if %newpass%==%newpass2% goto :sucess (
   ) ELSE (
       goto :fail
   )
:sucess
echo %newpass% > %filepath%
attrib +s +h pass.txt
::confirmar
echo.
echo. Su clave se actualizo en la ruta: %filepath%
echo.
echo. Presione una tecla para continuar . . .
pause>nul
goto :acceso

:fail
echo.
echo. Las claves deben coincidir, intente nuevamente . . .
pause>nul
cls
goto :actualizar