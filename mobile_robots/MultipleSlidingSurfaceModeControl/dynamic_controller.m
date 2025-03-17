function y = dynamic_controller(u)
e2=u(1:2);
e1_dot=u(3:4);
e1=u(5:6);
n_ddot=u(7:8);
n=u(9:10);
phi=u(11);
phi_dot=u(12);
%
global I m m_c d r b K1 K2 c21 c22 c31 c32 z1 z2
M_g = [m 0;0 I];                        % M_g1 = (S')*M*S
C_g = [2*K2/(r*r) m_c*d*phi_dot;-m_c*d*phi_dot 2*b*b*K2/(r*r)];%C_g = (S.')*M*S_dot+(S.')*C*S+K2*B_g*X
B_g = (1/r)*[1 1;b -b];                 %B_g=(S.')*B
J   = [cos(phi) d*sin(phi);sin(phi) -d*cos(phi)];
J_dot = [-sin(phi)*phi_dot d*cos(phi)*phi_dot;cos(phi)*phi_dot d*sin(phi)*phi_dot];
%
C2 = diag([c21 c22]);
C3 = diag([c31 c32]);
Z = diag([z1 z2]);
%
s2 = Z*e1+J*e2;
%
u_eq = (1/K1)*B_g^(-1)*(M_g*(n_ddot-J^(-1)*(Z*e1_dot+J_dot*e2))+C_g*n);
u_sw = -B_g^(-1)*M_g*J^(-1)*(C2*sign(s2)+C3*s2);
%
y = u_eq+u_sw;
end