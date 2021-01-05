%SIMULACION DEL THETA METHOD CON THETA=1/2 (METODO DEL TRAPECIO) CON CONDICIONES DE LA PARTE 5%
%PARAMETROS%
theta = 0.5;
N = 500;
deltaT = 0.002;
K = 500;
a=0;
b=1;
h=(b-a)/N;
SOL = thetaMetodo(theta,N,deltaT,K);
Tspace=linspace(0,deltaT*K,K+1);
Xspace=linspace(a,b,N+1);

fig = figure(1);
imagesc(Tspace,Xspace,SOL);
xlabel("Tiempo");
ylabel("Posición barra");
title("Evolución del perfil de temperaturas de la barra con theta=1/2");
colorbar();

X0 = zeros(1,N+1);
for i=1:N+1
  x_m = a+(i-1)*h;
  X0(i)=1000*x_m*(1-x_m)*(1+(1.5)*(x_m^3));
endfor

fig2 = figure(2);
mesh (Tspace, Xspace, SOL);
hold on;
T0 = zeros(1,N+1);
plot3(T0,Xspace,X0);
xlabel ("Tiempo");
ylabel ("Barra");
zlabel ("Temperatura");
title ("Evolución del perfil de temperaturas de la barra con theta=1/2");

%MODULO DESHABILITADO EJECUTAR DESDE LSODEDIFF.M
%EXTRA MATRIZ DE COMPARACIÓN% 
%TRUTH = eje5b(a,b,1,N,deltaT,K);
%fig3 = figure(3);
%mesh (Tspace, Xspace, abs(SOL-TRUTH));
%T0 = zeros(K+1,1);
%xlabel ("Tiempo");
%ylabel ("Barra");
%zlabel ("Temperatura");
%title ("Evolución de la diferencia entre las soluciones provistas por  ThetaMetodo con theta=1/2 y lsode");
%fig4 = figure(4);
%imagesc(Tspace,Xspace,abs(SOL-TRUTH));
%xlabel("Tiempo");
%ylabel("Posición barra");
%title ("Evolución de la diferencia entre las soluciones provistas por  ThetaMetodo con theta=1/2 y lsode");
%colorbar();