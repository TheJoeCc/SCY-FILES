@echo off

::este es el codigo reducido de mi proyecto de tecnologia, es el equivalente a un proyecto a escala.
::si usted desea probar el programa reducido puede descargarlo de mi repositorio en Github.
::https://github.com/JoelCatalancillo15/ProyectoTecologia

cd "C:\Users\%username%\Desktop"
md FILES
:bucle
cls
color 0D
::mi nombre
title By: Joel Catalan Contreras
echo.
echo. -------------------------------------------------------------------------------
echo.
echo.                 :ymNNNNNNNNNNNNNNNds.            
echo.                oMMMMMMMMMMMMMMMMMMMMN+                                
echo.                NMMMNoooooooooooooNMMMMhoooooooooooooooooooooo/.       
echo.               `NMMMN`            .dMMMMMMMMMMMMMMMMMMMMMMMMMMMMd.     
echo.               `NMMMN`              oMMMMMMMMMMMMMMMMMMMMMMMMMMMMm     
echo.               `NMMMN`               -mMMMMMMMMMMMMMMMMMMMMMMMMMMN`    
echo.               `NMMMN`                `+mMMMMMMMMMMMMMMMMMMMMMMMMN`    
echo.               `NMMMN`                   ./+oooooooooooooooooNMMMN`    
echo.               `NMMMN`                                      `NMMMN`    
echo.               `NMMMN`                                      `NMMMN`    
echo.               `NMMMN`                                      `NMMMN`    
echo.               `NMMMN`                                      `NMMMN`    
echo.               `NMMMN`                                      `NMMMN`    
echo.               `NMMMN`                                      `NMMMN`    
echo.               `NMMMN`                                      `NMMMN`    
echo.               `NMMMN`                                      `NMMMN`    
echo.               `NMMMN`                                      `NMMMN`    
echo.                NMMMNooooooooooooooooooooooooooooooooooooooooNMMMN     
echo.                oMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMo     
echo.                 :ymNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNmy:      
echo. 
echo. -------------------------------------------------------------------------------
echo.
::funcion de desbloqueo
set /p pass="Ingrese su clave: " 
if %pass%==ABC123 goto :acceso
::error de validacion
:error
cls
echo. Ingresaste una clave incorrecta, intentalo nuevamente.
pause>nul
goto :bucle
:acceso
cls
echo.
::variables de entorno
echo. Fecha: %DATE%  hora: %TIME%
echo. ---------------------------------
echo. (1) Ocultar la carpeta
echo. (2) Mostrar la carpeta
echo. (3) Ayuda
echo. --------------------------------- 
echo.
::funcion de opciones
echo. (Ingrese "99" para volver) 
set /p opc="Seleccione una opcion (1-3): "
if %opc%==1 goto :op1
if %opc%==2 goto :op2

::opcion numero 1
:op1
attrib +s +h FILES
cls
echo.
echo. ------------------------------------------
echo.  La carpeta fue oculatada exitosamente
echo. ------------------------------------------
echo.
pause
goto :acceso
::opcion numero 2
:op2
cls
attrib -s -h FILES
echo.
echo. ------------------------------------------
echo. La carpeta fue restaurada exitosamente
echo. ------------------------------------------
echo.
pause
goto :acceso
::opcion3
echo. Notas importantes:
echo.----------------------------------------------------------------------------------------
echo. 1.- Este programa crea automaticamente en el escritorio una carpeta llamada "FILES"
echo. 2.- En esta carpeta el usuario debe guardar los archivos que desea Ocultar
echo.. 3.- Cuando el usuario guarde los archivos en la carpeta debera seleccionar la opcion 2
echo.----------------------------------------------------------------------------------------
echo.
pause
