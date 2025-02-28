close all; clc;
% Thong so mo phong
dt = 0.05; N = 300;
% Khoi tao
nxc=2; nu=1; u=zeros(nu, N); xc=zeros(nxc,N+1); xc(:,1)=[3;0];
nw=2;W(:,1)=[0.3;-5];
%
for k=1:1:N
   u(k)=W(:,1)'*phi2x(xc(:,k));
   [T, y] = ode45(@(t,z) model2(t,z,u(k)), [0 dt],[xc(:,k);zeros(nu*nw+nw^2+1,1)]);
   xc(:,k+1)=y(end,1:nxc)';
end
% Plot figure
plot(xc');
   
   