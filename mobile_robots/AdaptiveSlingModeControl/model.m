function y = model(u)
phi = u(1);
phi_dot = u(2);
n = u(3:5);
to = u(6:8);
delta = u(9:11);
d = u(12:14);
global m I I_b L R
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
% Matrix C
c_11 = -I_b*cos(phi)*phi_dot/R;
c_12 = I_b*sin(phi)*phi_dot/R;
c_13 = 0;

c_21 = I_b*cos(phi-pi/3)*phi_dot/R;
c_22 = -I_b*sin(phi-pi/3)*phi_dot/R;
c_23 = 0;

c_31 = -I_b*sin(phi-pi/6)*phi_dot/R;
c_32 = I_b*cos(phi-pi/6)*phi_dot/R;
c_33 = 0;

C = [c_11 c_12 c_13;
    c_21 c_22 c_23;
    c_31 c_32 c_33];
% Matrix S
S = [-2/3*sin(phi) sin(phi)/3-sqrt(3)*cos(phi)/3 sin(phi)/3+sqrt(3)*cos(phi)/3;
    2/3*cos(phi) -cos(phi)/3-sqrt(3)*sin(phi)/3 -cos(phi)/3+sqrt(3)*sin(phi)/3;
    1/(3*L) 1/(3*L) 1/(3*L)];
% Matrix S_dot
S_dot = [-2*cos(phi)*phi_dot/3 (cos(phi)/3+sqrt(3)*sin(phi)/3)*phi_dot (cos(phi)-sqrt(3)*sin(phi))*phi_dot/3;
    -2*sin(phi)*phi_dot/3 (sin(phi)-sqrt(3)*cos(phi))*phi_dot/3 (sqrt(3)*cos(phi)+sin(phi))*phi_dot/3;
    0 0 0];
%
M_g = M*S;
C_g = M*S_dot+C*S;
%
n_dot = M_g^(-1)*(to - C_g*n-delta)+d;
y = n_dot;
end
