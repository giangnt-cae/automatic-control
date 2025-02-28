function y = kinematic_model(u)
v = u(1:3);
phi = u(4);
d = u(5:7);
global L
L = 0.28;
S = [-sin(phi) cos(phi) L;
    -sin(pi/3-phi) -cos(pi/3-phi) L;
    cos(pi/6-phi) -sin(pi/6-phi) L];
y = S^(-1)*v+d;
end