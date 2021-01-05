% Implementacion del theta metodo. Se retorna una matriz de dimension N+1,K+1.
% Donde el primer vector fila representa la evolucion de la temperatura en x=0 y
% el primer vector columna la temperatura en t=0 
function x=thetaMetodo(theta,N,deltaT,K)
  %constantes del problema solicitado%
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
  
  %Construir la matriz D%
  D = eye(N-1)+ (mu/h^2)*theta*deltaT*A;
  
  %Construir matriz F%
  F = zeros(N+1,K+1);
  for n=1:N+1
    for k=0:K
      t=k*deltaT;
      F(n,k+1)=1000*sqrt(abs(1-t));
    endfor
  endfor
  
  %Construir matriz g%
  g = zeros(N+1,K+1);
  for n=1:N+1
    for k=1:K
      t=k*deltaT;
      g(n,k)=deltaT*(theta*F(n,k+1)+(1-theta)*F(n,k));
    endfor
  endfor
  
  %Construir matriz solucion
  sol = zeros(N+1,K+1);
  %Cargo la temperatura inicial en el tiempo cero%
  sol(:,1)=u0;
  for k=2:K+1
    b=(eye(N-1)-(mu/h^2)*deltaT*(1-theta)*A)*sol(2:N,k-1)+g(2:N,k);
    sol(2:N,k) = D \ b;
    printf("thetaMetodo (%d/%d) | Simulando para t=%d \r",k,K+1,(k-1)*deltaT);
  endfor
  x = sol;
endfunction