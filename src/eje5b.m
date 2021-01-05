function solu=eje5b(a,b,mu,N,deltaT,K)
  %eje5b: Funcion que soluciona la ecuacion del calor en las condiciones pedidas del 5b utilizando
  %el comando lsode de octave.
  
  %PARAMETROS:
  % a,b: posicion inicial y final de la barra en el espacio
  % mu: coef. de conductividad termica del material
  % N: "diferencial" espacial de la barra
  % deltaT: "diferencial" temporal de la simulación
  % K: cantidad de "pasos" de tiempo a simular.

  %Dimension temporal donde se trabaja.
  Tspace=[0:deltaT:K*deltaT];
  %Dimension espacial donde se trabaja.
  h=(b-a)/N;
  Xspace=[a:h:b];
  
  %VECTOR DE TEMPERATURAS INICIAL%
  %La primera entrada es la temperatura en la posición "a", la segunda en la posición "b"%
  X0 = zeros(N+1,1);
  for i=1:N+1
    x_m = a+(i-1)*h;
    X0(i)=1000*x_m*(1-x_m)*(1+(1.5)*(x_m^3));
  endfor

  %Definicion del problema du/dt = f(x,t)%
  function xdot=f(x,t)
    h=(b-a)/N;
    %Construccion A%
    A = zeros(N-1,N-1);
    for i = 1:(N-1)
      A(i,i)=2;
    endfor
    for i= 1:N-2
      A(i,i+1)=-1;
      A(i+1,i)=-1;
    endfor
    
    %Construccion f%
    F = zeros(N-1,1);
    for i=1:N-1
      F(i)=1000*sqrt(abs(1-t));
    endfor
    
    xdot = (-mu/h^2)*A*x+F;
  endfunction
  printf("lsode | procesando matriz...\r");
  X=lsode("f",X0(2:N),Tspace);
  sol = zeros(N+1,K+1);
  sol(2:N,:)=transpose(X);
  sol(1,:) = zeros(1,K+1);
  sol(N+1,:) = zeros(1,K+1);
  solu = sol;
endfunction
