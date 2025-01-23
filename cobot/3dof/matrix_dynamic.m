syms theta d a anpha;
A = [cos(theta) -sin(theta) 0 a;...
    cos(anpha)*sin(theta) cos(anpha)*cos(theta) -sin(anpha) -sin(anpha)*d;...
    sin(anpha)*sin(theta) sin(anpha)*cos(theta) cos(anpha) cos(anpha)*d;...
    0 0 0 1];
syms q1 q2 q3 d1 a2 a3;
A1 = subs(A,[theta,d,a,anpha],[q1,d1,0,0]);
A2 = subs(A,[theta,d,a,anpha],[q2,0,0,pi/2]);
A3 = subs(A,[theta,d,a,anpha],[q3,0,a2,pi]);
AE = subs(A,[theta,d,a,anpha],[0,0,a3,pi]);

T_01 = A1; T_02 = A1*A2; T_03 = A1*A2*A3; T_0E = A1*A2*A3*AE;
T_12 = A2; T_23 = A3; T_3E = AE;
%
R_01 = T_01(1:3, 1:3); R_02 = T_02(1:3, 1:3);
R_03 = T_03(1:3, 1:3); R_0E = T_0E(1:3, 1:3);

P_12 = A2(1:3, 4); P_23 = A3(1:3, 4); P_3E = AE(1:3, 4);

e_z = [0 0 1]'; z_01 = R_01*e_z; z_02 = R_02*e_z; z_03 = R_03*e_z;
%% Matrix Jacobian J(q)
J(1:3,1) = simplify(cross(z_01, R_01*P_12 + R_02*P_23 + R_03*P_3E));
J(1:3,2) = simplify(cross(z_02, R_02*P_23 + R_03*P_3E));
J(1:3,3) = simplify(cross(z_03, R_03*P_3E));
J(4:6,:) = [z_01 z_02 z_03];
J_T = J(1:3,:); J_R = J(4:6,:);
%% Matrix D (joint revolute)
syms gx gy gz
g = [gx gy gz 0]';
D = zeros(4); D(1,2) = -1; D(2,1) = 1;
%% Matrix M(q)
% Link 1
syms m1 d1 s1x s1y s1z
s1x = 0; s1y = 0; s1z = d1/2;
s1 = [s1x s1y s1z 1]';


I1(1,1) = (m1*d1^2)/12 + m1*(s1y^2 + s1z^2);
I1(2,2) = (m1*d1^2)/12 + m1*(s1z^2 + s1x^2);
I1(3,3) = 0 + m1*(s1x^2 + s1y^2);
% Link 2
syms m2 a2 s2x s2y s2z
s2y = 0; s2z = 0; s2x = a2/2;
s2 = [s2x s2y s2z 1]';

I2(1,1) = 0 + m2*(s2y^2 + s2z^2);
I2(2,2) = (m2*a2^2)/12 + m2*(s2z^2 + s2x^2);
I2(3,3) = (m2*a2^2)/12 + m2*(s2x^2 + s2y^2);
% Link 3
syms m3 a3 s3x s3y s3z me
s3y = 0; s3z = 0; s3x = a3/2;
m3_hat = m3 + me;
s3x_hat = (m3*s3x + me*a3)/m3_hat; s3y_hat = s3y; s3z_hat = s3z;
s3_hat = [s3x_hat s3y_hat s3z_hat 1]';

I3(1,1) = 0 + m3*(s3y^2 + s3z^2) + me*0;
I3(2,2) = (m3*a3^2)/12 + m3*(s3z^2 + s3x^2) + me*a3^2;
I3(3,3) = (m3*a3^2)/12 + m3*(s3x^2 + s3y^2) + me*a3^2;
%% Matrix H
% H1
H1(1,1) = (-I1(1,1) + I1(2,2) + I1(3,3))/2;
H1(2,2) = (I1(1,1) - I1(2,2) + I1(3,3))/2;
H1(3,3) = (I1(1,1) + I1(2,2) - I1(3,3))/2;
H1(4,4) = m1;

H1(1,4) = m1*s1x; H1(2,4) = m1*s1y; H1(3,4) = m1*s1z;
H1(4,1) = m1*s1x; H1(4,2) = m1*s1y; H1(4,3) = m1*s1z;
% H2
H2(1,1) = (-I2(1,1) + I2(2,2) + I2(3,3))/2;
H2(2,2) = (I2(1,1) - I2(2,2) + I2(3,3))/2;
H2(3,3) = (I2(1,1) + I2(2,2) - I2(3,3))/2;
H2(4,4) = m2;

H2(1,4) = m2*s2x; H2(2,4) = m2*s2y; H2(3,4) = m2*s2z;
H2(4,1) = m2*s2x; H2(4,2) = m2*s2y; H2(4,3) = m2*s2z;
% H3
H3(1,1) = (-I3(1,1) + I3(2,2) + I3(3,3))/2;
H3(2,2) = (I3(1,1) - I3(2,2) + I3(3,3))/2;
H3(3,3) = (I3(1,1) + I3(2,2) - I3(3,3))/2;
H3(4,4) = m3_hat;

H3(1,4) = m3_hat*s3x_hat; H3(2,4) = m3_hat*s3y_hat; H3(3,4) = m3_hat*s3z_hat;
H3(4,1) = m3_hat*s3x_hat; H3(4,2) = m3_hat*s3y_hat; H3(4,3) = m3_hat*s3z_hat;
%% Matrix V(q,q_dot)
syms q1_dot q2_dot q3_dot
q = sym('q',[3 1]);
q(1) = q1; q(2) = q2; q(3) = q3;

qdot = sym('qdot',[3 1]);
qdot(1) = q1_dot; qdot(2) = q2_dot; qdot(3) = q3_dot;

m_link = sym('m_link',[3 1]);
m_link(1) = m1; m_link(2) = m2; m_link(3) = m3_hat;

s_link = sym('s_link',[4 4]);
s_link(:,1) = s1; s_link(:,2) = s2; s_link(:,3) = s3_hat;
T = sym('T',[12 4]);
T(1:4,:) = T_01; T(5:8,:) = T_12; T(9:12,:) = T_23;

H = sym('T',[12 4]);
H(1:4,:) = H1; H(5:8,:) = H2; H(9:12,:) = H3;

V = sym('V',[3 1]);
for i = 1 : 3
    V(i) = 0;
    for j = 1 : 3
        for m = 1 : 3
            for k = max([i j m]) : 3
                d2_Tk = 1; d_Tk = 1;
                for n = 1 : j
                   d2_Tk = d2_Tk * T(4*n-3:4*n,:);
                end
                d2_Tk = d2_Tk * D;
                for n = j+1 : m
                    d2_Tk = d2_Tk * T(4*n-3:4*n,:);
                end
                d2_Tk = d2_Tk * D;
                for n = m+1 : k
                    d2_Tk = d2_Tk * T(4*n-3:4*n,:);
                end
                for n = 1 : i
                    d_Tk = d_Tk * T(4*n-3:4*n,:);
                end
                d_Tk = d_Tk * D;
                for n = i+1 : k
                    d_Tk = d_Tk * T(4*n-3:4*n,:);
                end
                V(i) = V(i) + trace(d2_Tk * H(4*k-3:4*k,:) * transpose(d_Tk)) * qdot(j) * qdot(m);      
            end
        end
    end
    V(i) = simplify(V(i));
end
%% Matrix M(q)
M = sym('M',[3 3]);
for i = 1 : 3
    for j = 1 : 3
        M(i,j) = 0;
        for k = max(i, j) : 3
            d_Tk_qj = 1;
            d_Tk_qi = 1;
            for n = 1 : j
                d_Tk_qj = d_Tk_qj * T(4*n-3:4*n,:);
            end
            d_Tk_qj = d_Tk_qj * D;
            for n = j+1 : k
                d_Tk_qj = d_Tk_qj * T(4*n-3:4*n,:);
            end 
            for n = 1 : i
                d_Tk_qi = d_Tk_qi * T(4*n-3:4*n,:);
            end
            d_Tk_qi = d_Tk_qi * D;
            for n = i+1 : k
                d_Tk_qi = d_Tk_qi * T(4*n-3:4*n,:);
            end
            M(i,j) = M(i,j) + trace(d_Tk_qj * H(4*k-3:4*k,:) * transpose(d_Tk_qi));
        end
        M(i,j) = simplify(M(i,j));
    end
end
%% Matrix G(q)
G = sym('G',[3 1]);
for i = 1 : 3
    G(i) = 0;
    for j = 1 : 3
        d_Tj_qi = 1;
        for n = 1 : i
            d_Tj_qi = d_Tj_qi * T(4*n-3:4*n,:);
        end
        d_Tj_qi = d_Tj_qi * D;
        for n = i+1 : j
            d_Tj_qi = d_Tj_qi * T(4*n-3:4*n,:);
        end
        G(i) = G(i) - m_link(j) * transpose(g) * d_Tj_qi * s_link(:,j);
    end
    G(i) = simplify(G(i));
end