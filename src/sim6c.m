%Simulacion para la parte 6c --- El metodo no converge asintoticamente 0 (No se logra graficar)%
N = 500;
deltaT = 0.002;
K = 500; %N=K
a=0;
b=1;
h=(b-a)/N;
SOL = eje6c(N,deltaT,K);
lsodesol = lsode6c(a,b,1,N,deltaT,K);
Tspace=linspace(0,deltaT*K,K+1);
Xspace=linspace(a,b,N+1);

X0 = zeros(N+1,1);
for i=1:N+1
  x_m = a+(i-1)*h;
  X0(i)=1000*x_m*(1-x_m)*(1+(1.5)*(x_m^3));
endfor

%plotting...%
fig1 = figure(1);
mesh (Tspace, Xspace, lsodesol);
hold on;
T0 = zeros(K+1,1);
plot3(T0,Xspace,X0);
xlabel ("Tiempo");
ylabel ("Barra");
zlabel ("Temperatura");
title ("Evolución del perfil de temperaturas de la barra utlizando lsode");

fig2 = figure(2);
Tspace=linspace(0,deltaT*K,K+1);
Xspace=linspace(a,b,N+1);
imagesc(Tspace,Xspace,lsodesol);
xlabel("Tiempo");
ylabel("Posición barra");
title("Evolución del perfil de temperaturas de la barra utlizando lsode");
colorbar();

fig3 = figure(3);
Tspace=linspace(0,deltaT*K,K+1);
Xspace=linspace(a,b,N+1);
imagesc(Tspace,Xspace,SOL);
xlabel("Tiempo");
ylabel("Posición barra");
title("Evolución del perfil de temperaturas de la barra con theta=0");
colorbar();

fig4 = figure(4);
mesh (Tspace, Xspace, SOL);
hold on;
T0 = zeros(K+1,1);
plot3(T0,Xspace,X0);
xlabel ("Tiempo");
ylabel ("Barra");
zlabel ("Temperatura");
title ("Evolución del perfil de temperaturas de la barra con theta=0");