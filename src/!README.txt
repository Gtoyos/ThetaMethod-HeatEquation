--Implementación del theta método y simulaciones para el informe--
Autores: Toyos

La implementación se basa en scripts y funciones en Octave.
Para correr las simulaciones solicitadas se debe ejecutar los archivos con el prefijo "sim".
Los mismos llaman a las funciones implementadas en los archivos con prefijo "eje".
La implementación de la funcion thetametodo lleva el nombre distintivo "thetaMetodo.m".

Descripcion Rápida de los archivos:

eje5b: Función que ejecuta lsode para el problema 5b
eje6c: Implementación del theta metodo en el caso particular 6c

sim5b: Simulación de lsode para el problema 5b
sim5d: Simulación del theta metodo para el problema 5d (theta=3/4)
sim6c: Simulación del theta metodo para el problema 6c (theta=0, f(x,t=0))
sim7c: Simulación del theta metodo para el problema 7c (theta=1/2)
sim8b: Cálculo de errores entre lsode y theta método para los valores de theta solicitados (excepto theta0)
sim8bError6cOnly: Cálculo de errores entre lsode y theta método para el problema 6c.

lsode6c: Función para ejecutar lsode en el problema 6c.
lsodediff: Representación de la matriz de diferencia entre lsode y theta método para theta=1/2 y 3/4
thetaMetodo: Función thetaMetodo general.
