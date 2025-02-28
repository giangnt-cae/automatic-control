close all; clc;
% Tham so mo phong
dt=0.01; n=200; N=2000; epsi=10^-4; a=N/n; R=1;
% Khoi tao
nx=4; nu=1; u=zeros(nu,N); x=zeros(nx,N+1); x(:,1)=[3;0;0;0];

nc=10; nw=4; C=zeros(nc,a); W=zeros(nw,a+1); W(:,1)=[-0.5;-2;1;5];
for i=1:1:a
X=[]; q=[]; Ixu=[]; Ixx=[]; Iu=[-1.5];
 for j=1:1:n
     k=(i-1)*n+j;
     e=0.2*sin(500*k*dt);
     u(k)=W(:,i)'*phi2x(x(:,k))+e; 
     [T, y]=ode45(@(t,z) model(t,z,u(k)), [0 dt], [x(:,k); zeros(nu*nw+nw^2+1,1)]);
     x(:,k+1)=y(end,1:nx)';
     q=[q;y(end,nx+1)];Ixu=[Ixu; y(end,nx+2:nu*nw+nx+1)]; Ixx=[Ixx; y(end,nu*nw+nx+2:end)];
 end
 % Cap nhat luat dieu khien
 for j=1:1:n
     k=(i-1)*n+j;   
     phi11=phi1x(x(:,k))'; phi12=phi1x(x(:,k+1))'; 
     delta=phi11-phi12;
     X=[X; delta];
 end    
     P=[X 2*Ixu*kron(eye(nw),R)+2*Ixx*kron(eye(nw),W(:,i)*R)]; 
     K=q+Ixx*reshape(W(:,i)*R* W(:,i)',[nw^2,1]);
     arg=P\K; 
if i==1 || norm(arg(1:nc)-C(:,i-1))>epsi 
    C(:,i)=arg(1:nc); 
    W(:,i+1)=arg(nc+1:end); 
else
    break; 
end  
 end
% Su dung luat dieu khien toi uu
for p=i:1:a
for j=1:1:n    
k=(p-1)*n+j;
u(k)=W(:,i)'*phi2x(x(:,k)); 
[T, y]=ode45(@(t,z) model(t,z,u(k)), [0 dt], [x(:,k); zeros(nu*nw+nw^2+1,1)]); 
x(:,k+1)=y(end,1:nx)';
end 
end
% Plot figure
plot(x');

