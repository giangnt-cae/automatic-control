close all; clc;
t = linspace(0,1,size(x,2));

figure1 = figure('Visible','on','Position',[300 300 500 300],'Color','w');
set(0,'DefaultAxesFontName', 'Times New Roman');
axes('Parent',figure1,'FontSize',10);
plot(t,x(1,:),'r-','LineWidth',1.5,'DisplayName','x_1 ');
hold on;
plot(t,x(2,:),'b-','LineWidth',1.5,'DisplayName','x_2 ');
xlabel('Time (s)','FontWeight','normal','FontAngle','normal','FontSize',10);
ylabel('x','FontWeight','normal','FontAngle','normal','FontSize',10);
legend1 = legend('show');
set(legend1,'FontWeight','normal','FontAngle','normal','FontSize',10);
%grid on;
for j=1:1:i-1
c1(j) = C(1,j); 
c2(j) = C(2,j); 
c3(j) = C(3,j);
end

k = 1:1:i-1;

figure2 = figure('Visible','on','Position',[300 300 500 300],'Color','w');
set(0,'DefaultAxesFontName', 'Times New Roman');
axes('Parent',figure2,'FontSize',10);
plot(k,c1,'k-','LineWidth',1.5,'DisplayName','c_{1}');
hold on;
plot(k,c2,'b-','LineWidth',1.5,'DisplayName','c_{2}');
hold on;
plot(k,c3,'r-','LineWidth',1.5,'DisplayName','c_{3}');
xlabel('Iteration','FontWeight','normal','FontAngle','normal','FontSize',10);
legend1 = legend('show');
set(legend1,'FontWeight','normal','FontAngle','normal','FontSize',10);
set(gca,'xtick',0:15)
%grid on;
for j=1:1:i
w1(j) = W(1,j); 
w2(j) = W(2,j); 
end

k = 1:1:i;

figure3 = figure('Visible','on','Position',[300 300 500 300],'Color','w');
set(0,'DefaultAxesFontName', 'Times New Roman');
axes('Parent',figure3,'FontSize',10);
plot(k,w1,'r-','LineWidth',1.5,'DisplayName','w_{1}');
hold on;
plot(k,w2,'b-','LineWidth',1.5,'DisplayName','w_{2}');
xlabel('Iteration','FontWeight','normal','FontAngle','normal','FontSize',10);
legend1 = legend('show');
set(legend1,'FontWeight','normal','FontAngle','normal','FontSize',10);
set(gca,'xtick',0:15)
%grid on;
