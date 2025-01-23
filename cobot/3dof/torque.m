function y = torque(x)
    q1_2dot = x(1);
    q2_2dot = x(2);
    q3_2dot = x(3);
    
    q1 = x(4);
    q2 = x(5);
    q3 = x(6);

%     q2 = x(1);
%     q3 = x(2);
    
    q1_dot = 0; q2_dot = 0; q3_dot = 0;
%     gx = -9.81; gy = 0; gz = 0;
    gx = 0; gy = 0; gz = -9.81;
%% UR10 parameters
    a2 = 0.612; a3 = 0.572;
    m2 = 12.7; m3 = 4.27; me = 14.365;
%     s2x = 0.38; s3x = 0.24;
%     m2 = 20; m3 = 10; me = 15;
%     s2x = a2/2; s3x = a3/2;
%% Matrix M(q)
    M(1,1) = (a2^2*m2)/6 + (a2^2*m3)/2 + (a3^2*m3)/6 + (a2^2*me)/2 + (a3^2*me)/2 + (a2^2*m2*cos(2*q2))/6 + (a2^2*m3*cos(2*q2))/2 + (a2^2*me*cos(2*q2))/2 + (a3^2*m3*cos(2*q2 - 2*q3))/6 + (a3^2*me*cos(2*q2 - 2*q3))/2 + (a2*a3*m3*cos(q3))/2 + a2*a3*me*cos(q3) + (a2*a3*m3*cos(2*q2 - q3))/2 + a2*a3*me*cos(2*q2 - q3);
    M(1,2) = 0;
    M(1,3) = 0;
    M(2,1) = 0;
    M(2,2) = (a2^2*m2)/3 + a2^2*m3 + (a3^2*m3)/3 + a2^2*me + a3^2*me + a2*a3*m3*cos(q3) + 2*a2*a3*me*cos(q3);
    M(2,3) = -(a3*(2*a3*m3 + 6*a3*me + 3*a2*m3*cos(q3) + 6*a2*me*cos(q3)))/6;
    M(3,1) = 0;
    M(3,2) = -(a3*(2*a3*m3 + 6*a3*me + 3*a2*m3*cos(q3) + 6*a2*me*cos(q3)))/6;
    M(3,3) = (a3^2*(m3 + 3*me))/3;
%% Matrix V(q)
    V(1,1) = -(q1_dot*(2*a2^2*m2*q2_dot*sin(2*q2) + 6*a2^2*m3*q2_dot*sin(2*q2) + 6*a2^2*me*q2_dot*sin(2*q2) + 2*a3^2*m3*q2_dot*sin(2*q2 - 2*q3) - 2*a3^2*m3*q3_dot*sin(2*q2 - 2*q3) + 6*a3^2*me*q2_dot*sin(2*q2 - 2*q3) - 6*a3^2*me*q3_dot*sin(2*q2 - 2*q3) + 6*a2*a3*m3*q2_dot*sin(2*q2 - q3) - 3*a2*a3*m3*q3_dot*sin(2*q2 - q3) + 12*a2*a3*me*q2_dot*sin(2*q2 - q3) - 6*a2*a3*me*q3_dot*sin(2*q2 - q3) + 3*a2*a3*m3*q3_dot*sin(q3) + 6*a2*a3*me*q3_dot*sin(q3)))/12;
    V(2,1) = (a2^2*m2*q1_dot^2*sin(2*q2))/6 + (a2^2*m3*q1_dot^2*sin(2*q2))/2 + (a2^2*me*q1_dot^2*sin(2*q2))/2 + (a3^2*m3*q1_dot^2*sin(2*q2 - 2*q3))/6 + (a3^2*me*q1_dot^2*sin(2*q2 - 2*q3))/2 + (a2^2*m3*q1_dot*q3_dot*sin(q2 + q3))/2 + (a2^2*me*q1_dot*q3_dot*sin(q2 + q3))/2 + (a2*a3*m3*q3_dot^2*sin(q3))/2 + a2*a3*me*q3_dot^2*sin(q3) - (a3^2*m3*q1_dot*q2_dot*sin(q2))/6 + a2^2*m3*q2_dot*q3_dot*sin(q3) - (a3^2*m3*q2_dot*q3_dot*sin(q3))/3 - (a3^2*me*q1_dot*q2_dot*sin(q2))/2 + a2^2*me*q2_dot*q3_dot*sin(q3) - a3^2*me*q2_dot*q3_dot*sin(q3) - (a2^2*m3*q1_dot*q3_dot*sin(q2 - q3))/2 + (a3^2*m3*q1_dot*q2_dot*sin(q2 - 2*q3))/6 - (a2^2*me*q1_dot*q3_dot*sin(q2 - q3))/2 + (a3^2*me*q1_dot*q2_dot*sin(q2 - 2*q3))/2 + (a2*a3*m3*q1_dot^2*sin(2*q2 - q3))/2 + a2*a3*me*q1_dot^2*sin(2*q2 - q3) - (a2*a3*m3*q1_dot*q2_dot*sin(q2 + q3))/4 - (a2*a3*me*q1_dot*q2_dot*sin(q2 + q3))/2 + (a2*a3*m3*q1_dot*q3_dot*sin(q2))/4 - (a2*a3*m3*q2_dot*q3_dot*sin(q3))/2 + (a2*a3*me*q1_dot*q3_dot*sin(q2))/2 - a2*a3*me*q2_dot*q3_dot*sin(q3) + (a2*a3*m3*q1_dot*q2_dot*sin(q2 - q3))/4 - (a2*a3*m3*q1_dot*q3_dot*sin(q2 - 2*q3))/4 + (a2*a3*me*q1_dot*q2_dot*sin(q2 - q3))/2 - (a2*a3*me*q1_dot*q3_dot*sin(q2 - 2*q3))/2;
    V(3,1) = (a2*a3*m3*q1_dot^2*sin(q3))/4 - (a3^2*me*q1_dot^2*sin(2*q2 - 2*q3))/2 - (a3^2*m3*q1_dot^2*sin(2*q2 - 2*q3))/6 + (a2*a3*m3*q2_dot^2*sin(q3))/2 + (a2*a3*me*q1_dot^2*sin(q3))/2 + a2*a3*me*q2_dot^2*sin(q3) + (a3^2*m3*q1_dot*q2_dot*sin(q2))/6 + (a3^2*m3*q2_dot*q3_dot*sin(q3))/3 + (a3^2*me*q1_dot*q2_dot*sin(q2))/2 + a3^2*me*q2_dot*q3_dot*sin(q3) - (a3^2*m3*q1_dot*q2_dot*sin(q2 - 2*q3))/6 - (a3^2*me*q1_dot*q2_dot*sin(q2 - 2*q3))/2 - (a2*a3*m3*q1_dot^2*sin(2*q2 - q3))/4 - (a2*a3*me*q1_dot^2*sin(2*q2 - q3))/2 + (a2*a3*m3*q1_dot*q2_dot*sin(q2 + q3))/4 + (a2*a3*me*q1_dot*q2_dot*sin(q2 + q3))/2 - (a2*a3*m3*q1_dot*q2_dot*sin(q2 - q3))/4 - (a2*a3*me*q1_dot*q2_dot*sin(q2 - q3))/2;
%% Matrix G(q)
    G(1,1) = (m2*conj(a2)*cos(q2)*(conj(gx)*sin(q1) - conj(gy)*cos(q1)))/2 - a2*conj(gy)*cos(q1)*cos(q2)*(m3 + me) + a2*conj(gx)*cos(q2)*sin(q1)*(m3 + me) + (cos(q2 - q3)*conj(a3)*(m3 + me)*(2*m3*abs(me)^2 + me*abs(m3)^2)*(conj(gx)*sin(q1) - conj(gy)*cos(q1)))/(2*(me*abs(m3)^2 + m3*abs(me)^2));
    G(2,1) = (m2*conj(a2)*(conj(gx)*cos(q1)*sin(q2) - conj(gz)*cos(q2) + conj(gy)*sin(q1)*sin(q2)))/2 - a2*conj(gz)*cos(q2)*(m3 + me) + (conj(a3)*(m3 + me)*(2*m3*abs(me)^2 + me*abs(m3)^2)*(sin(q2 - q3)*conj(gx)*cos(q1) - cos(q2 - q3)*conj(gz) + sin(q2 - q3)*conj(gy)*sin(q1)))/(2*(me*abs(m3)^2 + m3*abs(me)^2)) + a2*conj(gx)*cos(q1)*sin(q2)*(m3 + me) + a2*conj(gy)*sin(q1)*sin(q2)*(m3 + me);
    G(3,1) = - (m2*conj(a2)*(sin(q2 - q3)*conj(gx)*cos(q1) - cos(q2 - q3)*conj(gz) + sin(q2 - q3)*conj(gy)*sin(q1)))/2 - (conj(a3)*(m3 + me)*(2*m3*abs(me)^2 + me*abs(m3)^2)*(sin(q2 - q3)*conj(gx)*cos(q1) - cos(q2 - q3)*conj(gz) + sin(q2 - q3)*conj(gy)*sin(q1)))/(2*(me*abs(m3)^2 + m3*abs(me)^2));
%%
    q_2dot = [q1_2dot q2_2dot q3_2dot]';
    to = M*q_2dot + V + G;
% to = G;
    y = -abs(to(2));
end