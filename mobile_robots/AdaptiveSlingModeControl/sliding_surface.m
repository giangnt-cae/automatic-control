function y = sliding_surface(u)
e2 = u(1:3);
e2_iter = u(4:6);
global anpha
y = e2+anpha*e2_iter;
end