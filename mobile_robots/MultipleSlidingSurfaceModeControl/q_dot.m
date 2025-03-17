function y = q_dot(u)
n = u(1:2);
phi = u(3);
%
S = Matrix_S(phi);
y = S*n;
end