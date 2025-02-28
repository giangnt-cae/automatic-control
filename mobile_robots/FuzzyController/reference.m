function y = reference(u)
%%
t = u(1);
%%
 % x_r = 2*cos(0.5*t); y_r = 2*sin(0.5*t); phi_r = pi/6;
% x_r = sin(3*t)*cos(t); y_r = sin(3*t)*sin(t); phi_r = 0.4*cos(0.2*t);
x_r = t; y_r = 2*sin(0.5*t); phi_r = pi/3;
% x_r = 3/20*t; y_r = 3/2*x_r; phi_r = pi/6;
%  x_r = sin(0.5*t)*cos(t); y_r = cos(0.5*t)*cos(t); phi_r = pi/4;
%%
y = [x_r; y_r; phi_r];
end
