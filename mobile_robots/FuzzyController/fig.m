t = 0:0.01:20;
 % x_r = 2*cos(0.5*t); y_r = 2*sin(0.5*t);
% x_r = sin(3*t).*cos(t); y_r = sin(3*t).*sin(t);
x_r = t; y_r = 2*sin(0.5*t);
% x_r = 3/20*t; y_r = 3/2*x_r;
% x_r = sin(0.5*t).*cos(t); y_r = cos(0.5*t).*cos(t);

figure(1);
subplot(2,2,1);plot(out.x,out.y,'--b','linewidth',1.5)
hold on
plot(x_r,y_r,'r','linewidth',1.5)
title('Trajectory of robot'); legend('Real','Reference');
xlabel('x (m)'); ylabel('y (m)');
grid on

subplot(2,2,2);plot(t,out.e,'linewidth',1.5);
title('Error'); legend('e_x','e_y','e_p_h_i');
xlabel('t (s)');
grid on

subplot(2,2,3);plot(t,out.v,'linewidth',1.5);
title('velocity'); legend('v_1','v_2','v_3');
xlabel('t (s)');
grid on

figure(2);
fis = readfis('fuzzy3');
subplot(2,2,1);plotmf(fis,'input',1);
xlabel('d (m)');
subplot(2,2,2);plotmf(fis,'input',2);
xlabel('deltaphi (rad)');
subplot(2,2,3);plotmf(fis,'output',1);
xlabel('V (m/s)');
subplot(2,2,4);plotmf(fis,'output',2);
xlabel('phi_dot');
