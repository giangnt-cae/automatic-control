function y = Matrix_B(u)
phi = u(1);
global r b
y = (1/r)*[cos(phi) cos(phi);sin(phi) sin(phi);b -b];