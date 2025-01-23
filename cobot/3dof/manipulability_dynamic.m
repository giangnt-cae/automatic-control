function y = manipulability_dynamic(x)
    s2x = x(1);
    s3x = x(2);
    q2 = x(3);
    q3 = x(4);
%% UR5 parameters
    a2 = 0.425; a3 = 0.392;
    m2 = 8.393; m3 = 2.33; me = 7.5;
%     s2x = 0.2125; s3x = 0.15;
%% UR10 parameters
%     a2 = 0.612; a3 = 0.572;
%     m2 = 12.7; m3 = 4.27; me = 15;
%     s2x = 0.38; s3x = 0.24;
%% Matrix J
    J_T(1,1) = -sin(q1)*(a2*cos(q2) + a3*cos(q2 - q3));
    J_T(1,2) = -cos(q1)*(a2*sin(q2) + a3*sin(q2 - q3));
    J_T(1,3) = a3*sin(q2 - q3)*cos(q1);
    
    J_T(2,1) = cos(q1)*(a2*cos(q2) + a3*cos(q2 - q3));
    J_T(2,2) = -sin(q1)*(a2*sin(q2) + a3*sin(q2 - q3));
    J_T(2,3) = a3*sin(q2 - q3)*sin(q1);
    
    J_T(3,1) = 0;
    J_T(3,2) = a2*cos(q2) + a3*cos(q2 - q3);
    J_T(3,3) = -a3*cos(q2 - q3);
    
    M(1,1) = (a2^2*m2)/24 + (a2^2*m3)/2 + (a3^2*m3)/24 + (a2^2*me)/2 + ...
        (a3^2*me)/2 + (m2*s2x^2)/2 + (m3*s3x^2)/2 + (m3*s3x^2*cos(2*q2 - 2*q3))/2 ...
        + (a2^2*m2*cos(2*q2))/24 + (a2^2*m3*cos(2*q2))/2 + (a2^2*me*cos(2*q2))/2 + ...
        (m2*s2x^2*cos(2*q2))/2 + (a3^2*m3*cos(2*q2 - 2*q3))/24 + ...
        (a3^2*me*cos(2*q2 - 2*q3))/2 + a2*m3*s3x*cos(2*q2 - q3) + ...
        a2*a3*me*cos(q3) + a2*m3*s3x*cos(q3) + a2*a3*me*cos(2*q2 - q3);
    M(1,2) = 0;
    M(1,3) = 0;
    
    M(2,1) = 0;
    M(2,2) = (a2^2*m2)/12 + a2^2*m3 + (a3^2*m3)/12 + a2^2*me + a3^2*me + ...
        m2*s2x^2 + m3*s3x^2 + 2*a2*a3*me*cos(q3) + 2*a2*m3*s3x*cos(q3);
    M(2,3) = - (a3^2*m3)/12 - a3^2*me - m3*s3x^2 - a2*a3*me*cos(q3) - a2*m3*s3x*cos(q3);
    
    M(3,1) = 0;
    M(3,2) = - (a3^2*m3)/12 - a3^2*me - m3*s3x^2 - a2*a3*me*cos(q3) - a2*m3*s3x*cos(q3);
    M(3,3) = (a3^2*m3)/12 + a3^2*me + m3*s3x^2;
    
%     w_d = det(J_T*(transpose(M)*M)^(-1)*transpose(J_T));
    w_d = det(J_T)/det(M);
    y = -abs(w_d);
end