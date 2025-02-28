t = 0:0.01:20;
% x_r = 2*cos(0.5*t); y_r = 2*sin(0.5*t);
% x_r = sin(0.5*t).*cos(t); y_r = cos(0.5*t).*cos(t);
x_r = t; y_r = 2*sin(0.5*t);

% figure(1);
% subplot(2,2,1);plot(out.x,out.y,'--b','linewidth',1.5)
% hold on
% plot(x_r,y_r,'r','linewidth',1.5)
% title('Trajectory of robot'); legend('Real','Reference');
% xlabel('x (m)'); ylabel('y (m)');
% grid on
% 
% subplot(2,2,2);plot(t,out.e1,'linewidth',1.5);
% title('Error'); legend('e_x','e_y','e_p_h_i');
% xlabel('t (s)');
% grid on
% 
% subplot(2,2,3);plot(t,out.u,'linewidth',1.5);
% title('torque');
% xlabel('t (s)');
% grid on
% 
% subplot(2,2,4);plot(t,out.v,'linewidth',1.5);
% title('velocity'); legend('v_1','v_2','v_3');
% xlabel('t (s)');
% grid on

fis = readfis('fuzzy0.fis');

% Tạo figure mới
figure;

% Vẽ membership function của input 1
subplot(1, 2, 1); % Chia figure thành 2 hàng, 1 cột, chọn ô 1
plotmf(fis, 'input', 1);
% title('Membership function of Input 1');

% Vẽ membership function của output 1
subplot(1, 2, 2); % Chọn ô 2
plotmf(fis, 'output', 1);
% title('Membership function of Output 1');