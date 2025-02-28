function y = dynamic_controller(u)
%
phi = u(1);
e2 = u(2:4);
e2_iter = u(5:7);
n_rdot = u(8:10);
K = u(11:13);
global L R m I I_b ro anpha
C2 = diag(ro*K');
% Matrix M
m_11 = -(I_b/R+2*m*R/3)*sin(phi);
m_12 = (I_b/R+2*m*R/3)*cos(phi);
m_13 = I_b*L/R+I*R/(3*L);

m_21 = (I_b/R+2*m*R/3)*sin(phi-pi/3);
m_22 = -(I_b/R+2*m*R/3)*cos(phi-pi/3);
m_23 = I_b*L/R+I*R/(3*L);

m_31 = (I_b/R+2*m*R/3)*cos(phi-pi/6);
m_32 = (I_b/R+2*m*R/3)*sin(phi-pi/6);
m_33 = I_b*L/R+I*R/(3*L);

M = [m_11 m_12 m_13;
    m_21 m_22 m_23;
    m_31 m_32 m_33];
% Matrix S
S = [-2/3*sin(phi) sin(phi)/3-sqrt(3)*cos(phi)/3 sin(phi)/3+sqrt(3)*cos(phi)/3;
    2/3*cos(phi) -cos(phi)/3-sqrt(3)*sin(phi)/3 -cos(phi)/3+sqrt(3)*sin(phi)/3;
    1/(3*L) 1/(3*L) 1/(3*L)];
%
M_g = M*S;
% sliding surface
s2 = e2+anpha*e2_iter;
% 
y = M_g*(n_rdot-anpha*e2+C2*min(1,max(-1,s2)));
end