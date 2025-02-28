function y = delta(u)
phi = u(1);
q_dot = u(2:4);
global f R k_x k_y k_z F_tx F_ty M_tz L
% Matrix D1
d_11 = -(f/R+2*R*k_x/3)*sin(phi);
d_12 = (f/R+2*R*k_y/3)*cos(phi);
d_13 = L*f/R+R*k_z/3;

d_21 = (f/R+2*R*k_x/3)*sin(phi-pi/3);
d_22 = -(f/R+2*R*k_y/3)*cos(phi-pi/3);
d_23 = L*f/R+R*k_z/3;

d_31 = (f/R+2*R*k_x/3)*cos(phi-pi/6);
d_32 = (f/R+2*R*k_y/3)*sin(phi-pi/6);
d_33 = L*f/R+R*k_z/3;

D1 = [d_11 d_12 d_13;
    d_21 d_22 d_23;
    d_31 d_32 d_33];
% Matrix D2
D2 = [-2*F_tx*R*sin(phi)/3, 2*F_ty*R*cos(phi)/3, M_tz*R/(3*L);
    2*F_tx*R*sin(phi-pi/3)/3, -2*F_ty*R*cos(phi-pi/3)/3, M_tz*R/(3*L);
    2*F_tx*R*cos(phi-pi/6)/3, 2*F_ty*R*sin(phi-pi/6)/3, M_tz*R/(3*L)];
%
y = D1*q_dot+D2*sign(q_dot);
end