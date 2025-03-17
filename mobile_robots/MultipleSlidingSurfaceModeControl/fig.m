t = 0:0.02:20;
x_r = 2*cos(0.5*t); y_r = 2*sin(0.5*t);

figure(1);
subplot(2,2,1);
plot(x,y,'b','linewidth',1.5)
hold on
plot(x_r,y_r,'r','linewidth',1.5)
title('Trajectory of robot'); legend('Real','Reference');
xlabel('x (m)'); ylabel('y (m)');
grid on

subplot(2,2,2);
plot(t, e,'linewidth',1.5);
title('Error'); legend('ex','ey');
xlabel('t (s)');
grid on

subplot(2,2,3);
plot(t, s,'linewidth',1.5);
title('Sliding surface');
xlabel('t (s)');
grid on

subplot(2,2,4);
plot(t(1:2:end), u,'linewidth',1.5);
title('Torque'); legend('left','right');
xlabel('t (s)');
grid on

