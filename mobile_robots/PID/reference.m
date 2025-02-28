function y = reference(u)
%%
t = u(1);
%%
x_r = 2*cos(0.5*t); y_r = 2*sin(0.5*t); phi_r = atan(-cos(0.5*t)/sin(0.5*t));
% x_r = sin(t)*cos(pi*t/6); y_r = sin(t)*sin(pi*t/6); phi_r = pi/4;
% x_r = sin(0.5*t).*cos(t); y_r = cos(0.5*t).*cos(t); phi_r = atan(-cos(0.5*t)/sin(0.5*t));
%%
y = [x_r; y_r; phi_r];
end
