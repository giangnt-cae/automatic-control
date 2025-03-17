function y = Matrix_C(u)
phi = u(1);
phi_dot = u(2);
%
global m_c d
%
y = [0 0 m_c*d*cos(phi)*phi_dot;
     0 0 m_c*d*sin(phi)*phi_dot;
     0 0 0];
end