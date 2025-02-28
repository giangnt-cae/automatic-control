function y = model2(t,z,u)
x1 = z(1);
x2 = z(2);
%
x     =[x1;x2];
x1dot = -x1 + x2;
x2dot = -0.5*x1 - 0.5*x2*(1-(cos(2*x1)+2)^2) + (cos(2*x1) +2)*u;
xdot  = [x1dot; x2dot];
%
dq    =x1^2 + x2^2;
dIxu = -kron(phi2x(x),u);
dIxx = kron(phi2x(x),phi2x(x));
%
y = [xdot; dq; dIxu; dIxx];