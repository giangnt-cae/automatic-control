function y = n_dot(u)
n = u(1:2);
phi_dot = u(3);
u_a = u(4:5);
%
global m I K1 K2 r m_c d b
% M_g1 = (S')*M*S
M_g = [m 0;0 I];
%C_g = (S.')*M*S_dot+(S.')*C*S+K2*B_g*X
C_g = [2*K2/(r*r) m_c*d*phi_dot;-m_c*d*phi_dot 2*b*b*K2/(r*r)];
%B_g=(S.')*B
B_g = (1/r)*[1 1;b -b];
%
y = -(M_g^(-1)*C_g*n)+K1*M_g^(-1)*B_g*u_a;
end
