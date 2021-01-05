%Parte 6c. Mismas condiciones que parte 5, pero f(x,t)=0 y theta=0%
%Se retorna una matriz de dimension N+1,K+1.
% Donde el primer vector fila representa la evolucion de la temperatura en x=0 y
% el primer vector columna la temperatura en t=0%
%ADVERTENCIA: el metodo converge sii h^2/2mu > deltaT%
function x=eje6c(N,deltaT,K)
  a=0;
  b=1;
  mu=1;
  h=(b-a)/N;
  %Temperatura inicial%
  u0 = zeros(N+1,1);
  for u=1:N+1;
    xm = a+(u-1)*h;
    u0(u)=1000*xm*(1-xm)*(1+1.5*xm^3);
  endfor;

  %Construir la matriz A%
  A = zeros(N-1,N-1);
  for i = 1:(N-1)
    A(i,i)=2;
  endfor
  for i= 1:N-2
    A(i,i+1)=-1;
    A(i+1,i)=-1;
  endfor
  %Construyo la matriz E^1%
  E = eye(N-1)-(mu/h^2*deltaT)*A;
  
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
  endfor
  x = sol;
endfunction