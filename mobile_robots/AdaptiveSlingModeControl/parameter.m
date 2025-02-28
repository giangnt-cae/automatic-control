clc
%
global m R I_b I L c11 c12 c13 f k_x k_y k_z F_tx F_ty M_tz ro anpha
m = 16.60312873;
R = 0.0625;
I_b = 862.394*10^(-6);
I = 886699.550*10^(-6);
L = 0.28;
f = 0.2;
k_x = 0.5; k_y = 0.5; k_z = 0.5;

F_tx = 10; F_ty = 5; M_tz = 5;

c11 = 5; c12 = 5; c13 = 5;
anpha = diag([5;5;5]);
ro =6;