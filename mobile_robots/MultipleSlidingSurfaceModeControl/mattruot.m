function y = mattruot(u)
e2=u(1:2);
e1=u(3:4);
phi=u(5);
global I m m_c d r b K1 K2 z1 z2
J   = [cos(phi) d*sin(phi);sin(phi) -d*cos(phi)];
Z = diag([z1 z2]);
s2 = Z*e1+J*e2;
y=s2;
end