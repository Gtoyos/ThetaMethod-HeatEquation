%COMPARACION DEL THETA METHOD CON CONDICIONES DEL EJERCICIO 5d PARA THETA= 1/2 y 3/4%
%CON SOLUCION PROVISTA POR LSODE%

%PARAMETROS%
theta = 0.75;
N = 500;
deltaT = 0.002;
K = 500;
a=0;
b=1;
h=(b-a)/N;
SOL = thetaMetodo(theta,N,deltaT,K);
Tspace=linspace(0,deltaT*K,K+1);
Xspace=linspace(a,b,N+1);


%EXTRA MATRIZ DE COMPARACIÓN%
TRUTH = eje5b(a,b,1,N,deltaT,K);

fig1 = figure(1);
mesh (Tspace, Xspace, abs(SOL-TRUTH));
T0 = zeros(K+1,1);
xlabel ("Tiempo");
ylabel ("Barra");
zlabel ("Temperatura");
title ("Evolución de la diferencia entre las soluciones provistas por  ThetaMetodo con theta=3/4 y lsode");
fig2 = figure(2);
imagesc(Tspace,Xspace,abs(SOL-TRUTH));
xlabel("Tiempo");
ylabel("Posición barra");
title ("Evolución de la diferencia entre las soluciones provistas por  ThetaMetodo con theta=3/4 y lsode");
colorbar();

theta = 0.5;

SOL2 = thetaMetodo(theta,N,deltaT,K);
fig3 = figure(3);
mesh (Tspace, Xspace, abs(SOL2-TRUTH));
T0 = zeros(K+1,1);
xlabel ("Tiempo");
ylabel ("Barra");
zlabel ("Temperatura");
title ("Evolución de la diferencia entre las soluciones provistas por  ThetaMetodo con theta=1/2 y lsode");
fig4 = figure(4);
imagesc(Tspace,Xspace,abs(SOL2-TRUTH));
xlabel("Tiempo");
ylabel("Posición barra");
title ("Evolución de la diferencia entre las soluciones provistas por  ThetaMetodo con theta=1/2 y lsode");
colorbar();