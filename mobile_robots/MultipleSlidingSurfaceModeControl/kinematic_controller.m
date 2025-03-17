function y = kinematic_controller(u)
e1=u(1:2);
q_rdot=u(3:4);
phi=u(5);
%
global c11 c12 d
J=[cos(phi) d*sin(phi);sin(phi) -d*cos(phi)];
C1 = diag([c11 c12]);
%
y=-J^(-1)*(C1*e1-q_rdot);
end
