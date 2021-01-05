%%% COMPARACION DE ERRORES --VERSION OPTIMIZADA EJERCICIO 6C--- %%%

%Parametros iniciales%
mu=1;
a=0;
b=1;
N=500;

%%coordenadas del error a observar%%
x=0.5;
t=0.00005;

%%Parametros de simulación. Modifique "total" para cambiar la cantidad de iteraciones. (t/fK<Delta t < t/sK)
sK=ceil(t*2*mu*N^2)+1; %Delta minimo para que el theta=0 converga asintoticamente.
total = 20;
fK=ceil(t*2*mu*N^2)+1 + total; %fK > sK

%Construccion del vector deltas%
totalT=fK-sK+1;
deltas = zeros(1,fK-sK+1);
deltas(1)=t/sK;
for i=1:floor((fK-sK)/2)
  deltas(i+1)=t/((sK+i));
endfor
for i=floor((fK-sK)/2)+1:fK-sK
  deltas(i+1)=t/((sK+i)^2);
endfor

%coordenada de la posición x en la matriz
h=(b-a)/N;
cx = round((x-a)/h)+1;

%Solucion referencia LSODE% 
lsodeSol = lsode6c(a,b,mu,N,t,1);
truth = lsodeSol(cx,2);

%%VECTOR DE ERRORES%%
vdiff = zeros(1,totalT);

%%INICIO DEL MÉTODO%%
%Se construyen elementos constantes en N

%Temperatura inicial%
u0 = zeros(N+1,1);
for u=1:N+1;
  xm = a+(u-1)*h;
  u0(u)=1000*xm*(1-xm)*(1+1.5*xm^3);
endfor;
%Construir la matriz A%
A = zeros(N-1,N-1);
for i =1:(N-1)
  A(i,i)=2;
endfor
for i=1:N-2
  A(i,i+1)=-1;
  A(i+1,i)=-1;
endfor
%Inicio de la iteracion con deltaT
printf("\n");
for i=1:totalT
  K = round(t/deltas(i));
  %Construyo la matriz E^1%
  E = eye(N-1)-(mu/h^2*deltas(i))*A;
  %Construir matriz solucion
  sol = zeros(N+1,K+1);
  %Matriz E^k que se va construyendo en la iteracion...%
  Ek = E;
  %Cargo la temperatura inicial en el tiempo cero%
  sol(:,1)=u0;
  %u^1 = E*u0%
  sol(2:N,2)=E*u0(2:N);
  for k=3:K+1
    sol(2:N,k)=E*u0(2:N);
    E = Ek*E;
    printf("E^k (%d/%d) |theta=0 (%d/%d) | Iterando con deltaT=%d...\r",k,K+1,i,totalT,deltas(i));
  endfor
  solution = sol(cx,K+1);
  vdiff(i)= abs(truth-solution);
  printf("theta=0 (%d/%d) | Iterando con deltaT=%d...\r",i,totalT,deltas(i));
endfor

fig1= figure(1);
plot(deltas,vdiff,"-")
set (gca (), "xdir", "reverse");
legend("theta=0");
xlabel("delta t");
ylabel("Error (|y_x - y(x)|)");
titulo = sprintf("Gráfica del error en (t=%f, x=%f) (N=%d) en función de deltaT para f(x,t)=0",t,x,N);
title(titulo)
