function y = phi1x(x)
x1 = x(1);%x
x2 = x(2);%x_dot
x3 = x(3);%teta
x4 = x(4);%teta_dot
%
y = [ x1^2; x1*x2; x1*x3; x1*x4; x2^2; x2*x3; x2*x4; x3^2; x3*x4; x4^2];