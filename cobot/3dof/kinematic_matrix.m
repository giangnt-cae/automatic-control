syms theta d a anpha;
T = [cos(theta) -sin(theta) 0 a;...
    cos(anpha)*sin(theta) cos(anpha)*cos(theta) -sin(anpha) -sin(anpha)*d;...
    sin(anpha)*sin(theta) sin(anpha)*cos(theta) cos(anpha) cos(anpha)*d;...
    0 0 0 1];

syms q1 q2 q3 d1 a2 a3;
T_01 = subs(T,[theta,d,a,anpha],[q1,d1,0,0]);
T_12 = subs(T,[theta,d,a,anpha],[q2,0,0,pi/2]);
T_23 = subs(T,[theta,d,a,anpha],[q3,0,a2,pi]);
T_3E = subs(T,[theta,d,a,anpha],[0,0,a3,pi]);

T_01 = simplify(T_01); T_02 = simplify(T_01*T_12);
T_03 = simplify(T_01*T_12*T_23); T_0E = simplify(T_01*T_12*T_23*T_3E);
    
R_01 = T_01(1:3, 1:3); R_02 = T_02(1:3, 1:3);
R_03 = T_03(1:3, 1:3); R_0E = T_0E(1:3, 1:3);

P_12 = T_12(1:3, 4); P_23 = T_23(1:3, 4); P_3E = T_3E(1:3, 4);

e_z = [0 0 1]'; z_01 = R_01*e_z; z_02 = R_02*e_z; z_03 = R_03*e_z;

J(1:3,1) = simplify(cross(z_01, R_01*P_12 + R_02*P_23 + R_03*P_3E));
J(1:3,2) = simplify(cross(z_02, R_02*P_23 + R_03*P_3E));
J(1:3,3) = simplify(cross(z_03, R_03*P_3E));
J(4:6,:) = [z_01 z_02 z_03];

J_T = J(1:3,:); J_R = J(4:6,:);
syms v_max q1_dotmax q2_dotmax q3_dotmax
T_v = diag([1/v_max 1/v_max 1/v_max]);
T_q = diag([1/q1_dotmax 1/q2_dotmax 1/q3_dotmax]);
J_T_hat = simplify(T_v*J_T*(T_q^-1));
eig_J = simplify(eig(transpose(J_T_hat)*J_T_hat));