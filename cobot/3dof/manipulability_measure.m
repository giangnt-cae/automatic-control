function y = manipulability_measure(x)
    a2 = x(1);
    a3 = x(2);
    q2 = x(3);
    q3 = x(4);

    w = -a2^2*a3^2*(cos(2*q3)/2 - 1/2)*((a2^2*cos(2*q2))/2 + (a3^2*cos(2*q2 ...
        - 2*q3))/2 + a2^2/2 + a3^2/2 + a2*a3*cos(2*q2 - q3) + a2*a3*cos(q3));
    y = -abs(w);
end