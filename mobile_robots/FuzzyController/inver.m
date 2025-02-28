function y = inver(u)
delta_x = u(1);
delta_y = u(2);
v_ro = u(3);
phi_ldot = u(4);
phi = u(5);
global L
L = 0.28;
%
beta = atan2(delta_y,delta_x);
x_ldot = v_ro*cos(beta-phi);
y_ldot = v_ro*sin(beta-phi);
% Matrix H
H = [0 -sqrt(3)/3 sqrt(3)/3;
    2/3 -1/3 -1/3;
    1/(3*L) 1/(3*L) 1/(3*L)];
V_wh = H^(-1)*[x_ldot y_ldot phi_ldot]';
V_wmax = 2;
V_wh1 = abs(V_wh(1,1));
V_wh2 = abs(V_wh(2,1));
V_wh3 = abs(V_wh(3,1));
V_whh = [V_wh1;V_wh2;V_wh3];
M = max(V_whh,[],1);
if M>V_wmax
    V_w = (V_wmax/M)*V_wh;
else
    V_w = V_wh;
end
y = V_w;
end
