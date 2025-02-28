
t = 0:0.01:20;
x_r = 2*cos(0.5*t); y_r = 2*sin(0.5*t);
% x_r = sin(t).*cos(pi*t/6); y_r = sin(t).*sin(pi*t/6);
  % x_r = sin(0.5*t).*cos(t); y_r = cos(0.5*t).*cos(t);
figure(1);
subplot(2,2,1);
plot(out.x,out.y,'b','linewidth',1.5)
hold on
plot(x_r,y_r,'r','linewidth',1.5)
title('Trajectory of robot'); legend('Real','Reference');
xlabel('x (m)'); ylabel('y (m)');
grid on

subplot(2,2,2);
plot(out.e,'linewidth',1.5);
title('Error'); legend('x','y','phi');
xlabel('t (s)');
grid on

subplot(2,2,3);
plot(out.v,'linewidth',1.5);
title('Velocity');
xlabel('t (s)');
grid on

