%%% COMPARACION DE ERRORES %%%
%CALCULO DE ERRORES%
%Parametros iniciales%
mu=1;
a=0;
b=1;
N=500;
K=500;
h=(b-a)/N;

%%posicion del error a observar%
x=0.5;
t=0.045;

sK=10;
fK=20; %fK <= K

deltas = zeros(1,fK-sK+1);
deltas(1)=t/sK;
for i=1:fK-sK
  deltas(i+1)=t/(sK+i);
endfor

totalT=fK-sK+1; %cantidad maxima de iteraciones.

%vector con resultado de la resolucion de la ecu.dif en la posicion dada dado el deltaT
%ej: metodo_vdiff(1)= solucion dado deltaT=sT
trapVdiff = zeros(1,totalT);
theta75Vdiff = zeros(1,totalT);
theta0Vdiff = zeros(1,totalT);

%Vamos a suponer que la solucion verdadera es la proporcionada por lsode%
lsodeSol = eje5b(a,b,mu,N,deltas(1),K);
TRUTH = lsodeSol(round((x-a)/h)+1,round(t/deltas(1))+1);

%Error trapecio%
for i=1:totalT
  tSol = thetaMetodo(0.5,N,deltas(i),K);
  trapVdiff(i) = abs( TRUTH - tSol(round((x-a)/h)+1,round(t/deltas(i))+1));
  printf("Trapecio (%d/%d) | Iterando con deltaT=%d...\n",i,totalT,deltas(i));
endfor

%Error theta0.75%
for i=1:totalT
  tSol = thetaMetodo(0.75,N,deltas(i),K);
  theta75Vdiff(i) = abs( TRUTH - tSol(round((x-a)/h)+1,round(t/deltas(i))+1));
  printf("theta=0.75 (%d/%d) | Iterando con deltaT=%d...\n",i,totalT,deltas(i));
endfor

fig = figure(1);
plot(deltas,trapVdiff,"-",deltas,theta75Vdiff,"-");
legend("theta=0.5 (trapecio)", "theta=0.75");
xlabel("delta t");
ylabel("Error (|y_x - y(x)|)");
title("Grafica del error en t=0.045, x=0.5 en función de delta t (N=500) con f(x,t)=1000sqrt(|1-t|)")
set (gca (), "xdir", "reverse");
