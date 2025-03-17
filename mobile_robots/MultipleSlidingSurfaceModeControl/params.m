clc;
global r b d L m_c m_w I_w I_c I_m K1 K2 I m c11 c12 c21 c22 c31 c32 z1 z2
%
r = 0.15;
b = 0.75;
d = 0.3;
L = 0.1;
m_c = 36;
m_w = 1;
I_w = 0.005;
I_c = 15.625;
I_m = 0.0025;
K1 = 7.2;
K2 = 2.592;
I = I_c + m_c*d*d + 2*m_w*b*b + 2*I_m;
m = m_c + 2*m_w;
%tham so bo dieu khien truot
c11 =1;
c12 =1;
c21 =1;
c22 =1;
c31 =1;
c32 =1;
z1  =1;
z2  =1;
%
C1 =diag([c11 c12]);
C2 = diag([c21 c22]);
C3 = diag([c31 c32]);
Z = diag([z1 z2]);


