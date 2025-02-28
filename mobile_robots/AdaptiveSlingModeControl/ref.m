function y = ref(u)
t = u(1);

% x_r = 2*cos(0.5*t); y_r = 2*sin(0.5*t); phi_r = pi/6;
% x_r = sin(0.5*t)*cos(t); y_r = cos(0.5*t)*cos(t);phi_r = pi/6;
x_r = t; y_r = 2*sin(0.5*t); phi_r = pi/6;
y = [x_r y_r phi_r]';