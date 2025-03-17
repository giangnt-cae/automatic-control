function y = Matrix_M(u)
phi = u(1);
%
global m m_c d I
%
m11 = m;
m12 = 0;
m13 = m_c*d*sin(phi);
%
m21 = 0;
m22 = m;
m23 = -m_c*d*cos(phi);
%
m31 = m_c*d*sin(phi);
m32 = -m_c*d*cos(phi);
m33 = I;
%
y = [m11 m12 m13;m21 m22 m23;m31 m32 m33];
end
