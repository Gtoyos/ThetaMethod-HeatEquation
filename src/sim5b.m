%SIMULACION DE LSODE%
%PARAMETROS%
N = 500;
deltaT = 0.002;
K = 500;
a=0;
b=1;
h=(b-a)/N;
mu=1;

SOL = eje5b(a,b,mu,N,deltaT,K);
Tspace=linspace(0,deltaT*K,K+1);
Xspace=linspace(a,b,N+1);

fig = figure(1);
imagesc(Tspace,Xspace,SOL);
xlabel("Tiempo");
ylabel("Posición barra");
title("Evolución del perfil de temperaturas de la barra");
colorbar();

X0 = zeros(N+1,1);
for i=1:N+1
  x_m = a+(i-1)*h;
  X0(i)=1000*x_m*(1-x_m)*(1+(1.5)*(x_m^3));
endfor

fig2 = figure(2);
mesh (Tspace, Xspace, SOL);
hold on;
T0 = zeros(K+1,1);
plot3(T0,Xspace,X0);
xlabel ("Tiempo");
ylabel ("Barra");
zlabel ("Temperatura");
title ("Evolución del perfil de temperaturas de la barra");

%display temp inicial%
fig3 = figure(3);
Q = zeros(N+1,K+1);
for i=1:501;
  Q(:,i)=X0;
endfor
imagesc(Tspace,Xspace,transpose(Q));
xlabel("Posición barra");
title("Perfil de temperatura inicial en t=0");