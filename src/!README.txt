--Implementaci�n del theta m�todo y simulaciones para el informe--
Autores: Toyos

La implementaci�n se basa en scripts y funciones en Octave.
Para correr las simulaciones solicitadas se debe ejecutar los archivos con el prefijo "sim".
Los mismos llaman a las funciones implementadas en los archivos con prefijo "eje".
La implementaci�n de la funcion thetametodo lleva el nombre distintivo "thetaMetodo.m".

Descripcion R�pida de los archivos:

eje5b: Funci�n que ejecuta lsode para el problema 5b
eje6c: Implementaci�n del theta metodo en el caso particular 6c

sim5b: Simulaci�n de lsode para el problema 5b
sim5d: Simulaci�n del theta metodo para el problema 5d (theta=3/4)
sim6c: Simulaci�n del theta metodo para el problema 6c (theta=0, f(x,t=0))
sim7c: Simulaci�n del theta metodo para el problema 7c (theta=1/2)
sim8b: C�lculo de errores entre lsode y theta m�todo para los valores de theta solicitados (excepto theta0)
sim8bError6cOnly: C�lculo de errores entre lsode y theta m�todo para el problema 6c.

lsode6c: Funci�n para ejecutar lsode en el problema 6c.
lsodediff: Representaci�n de la matriz de diferencia entre lsode y theta m�todo para theta=1/2 y 3/4
thetaMetodo: Funci�n thetaMetodo general.
