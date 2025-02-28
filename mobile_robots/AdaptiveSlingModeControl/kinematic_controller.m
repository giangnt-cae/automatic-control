function y = kinematic_controller(u)
phi = u(1);
e1 = u(2:4);
q_rdot = u(5:7);
global c11 c12 c13 L
S = [-2/3*sin(phi) sin(phi)/3-sqrt(3)*cos(phi)/3 sin(phi)/3+sqrt(3)*cos(phi)/3;
    2/3*cos(phi) -cos(phi)/3-sqrt(3)*sin(phi)/3 -cos(phi)/3+sqrt(3)*sin(phi)/3;
    1/(3*L) 1/(3*L) 1/(3*L)];
C1 = diag([c11 c12 c13]);

y = S^(-1)*(q_rdot-C1*e1);
end