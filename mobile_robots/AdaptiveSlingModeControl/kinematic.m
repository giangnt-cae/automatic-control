function y = kinematic(u)
phi = u(1);
n = u(2:4);
global L
% Matrix S
S = [-2/3*sin(phi) sin(phi)/3-sqrt(3)*cos(phi)/3 sin(phi)/3+sqrt(3)*cos(phi)/3;
    2/3*cos(phi) -cos(phi)/3-sqrt(3)*sin(phi)/3 -cos(phi)/3+sqrt(3)*sin(phi)/3;
    1/(3*L) 1/(3*L) 1/(3*L)];
%
y = S*n;
end