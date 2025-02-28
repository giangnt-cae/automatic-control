close all; clc;
t = linspace(0,20,size(u,2));
%
figure5 = figure('Visible','on','Position',[300 300 500 300],'Color','w');
set(0,'DefaultAxesFontName', 'Times New Roman');
axes('Parent',figure5,'FontSize',10);
plot(t,u,'b-','LineWidth',1,'DisplayName','Tin hieu dieu khien u');
xlabel('Time (s)','FontWeight','normal','FontAngle','normal','FontSize',10);
ylabel('u','FontWeight','normal','FontAngle','normal','FontSize',10);
legend1 = legend('show');
set(legend1,'FontWeight','normal','FontAngle','normal','FontSize',10);
%grid on;