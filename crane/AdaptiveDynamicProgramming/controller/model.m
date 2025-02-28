function y = model(t,z,u)
x1 = z(1);%x
x2 = z(2);%x_dot
x3 = z(3);%teta
x4 = z(4);%teta_dot
%
M = 1.1; m = 0.9;l = 0.3; g = 9.81; Q = diag([1.5,1.5,1.5,1.5]); R=1;
%
f1 =(m*l*x4^2*sin(x3)+m*g*sin(x3)*cos(x3))/(M+m*l*(sin(x3))^2);
g1 = 1/(M+m*l*(sin(x3))^2);
f2 = -((M+m)*g*sin(x3)+m*l*x4^2*sin(x3)*cos(x3))/((M+m*l*(sin(x3))^2)*l);
g2 = -cos(x3)/((M+m*l*(sin(x3))^2)*l);
x  = [x1; x2; x3; x4];
%
x_dot = [x2; f1+g1*u; x4; f2+g2*u];
dq    = x'*Q*x;
dIxu  = -kron(phi2x(x),u);
dIxx  = kron(phi2x(x),phi2x(x));
%
y = [x_dot;dq;dIxu; dIxx];