function y = controller(u)
e = u(1:3);
X_rdot = u(4:6);
phi = u(7);
e_iter = u(8:10);
global k_11 k_12 k_13 L k_21 k_22 k_23
S = [-sin(phi) cos(phi) L;
    -sin(pi/3-phi) -cos(pi/3-phi) L;
    cos(pi/6-phi) -sin(pi/6-phi) L];
K1 = [k_11 0 0;0 k_12 0;0 0 k_13];
K2 = diag([k_21 k_22 k_23]);
y = S*(X_rdot + K1*e+K2*e_iter);