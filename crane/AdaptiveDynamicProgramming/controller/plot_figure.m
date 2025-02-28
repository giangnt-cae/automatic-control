close all; clc;
t = linspace(0,20,size(x,2));

%X1 = [x(1,:) x1(1,:)+5*ones(1,size(x1,2))];
figure1 = figure('Visible','on','Position',[300 300 500 300],'Color','w');
set(0,'DefaultAxesFontName', 'Times New Roman');
axes('Parent',figure1,'FontSize',10);
plot(t,x(1,:),'r-','LineWidth',1.5,'DisplayName','x_1 (Under ADP)');
hold on
plot(t,xc(1,:),'r--','LineWidth',1.5,'DisplayName','x_1 (Unlearned)');
xlabel('Time (s)','FontWeight','normal','FontAngle','normal','FontSize',10);
ylabel('x_1','FontWeight','normal','FontAngle','normal','FontSize',10);
legend1 = legend('show');
set(legend1,'FontWeight','normal','FontAngle','normal','FontSize',10);
%grid on;
%
figure5 = figure('Visible','on','Position',[300 300 500 300],'Color','w');
set(0,'DefaultAxesFontName', 'Times New Roman');
axes('Parent',figure5,'FontSize',10);
plot(t,x(2,:),'b-','LineWidth',1.5,'DisplayName','x_2 (Under ADP)');
hold on
plot(t,xc(2,:),'b--','LineWidth',1.5,'DisplayName','x_2 (Unlearned)');
xlabel('Time (s)','FontWeight','normal','FontAngle','normal','FontSize',10);
ylabel('x_2','FontWeight','normal','FontAngle','normal','FontSize',10);
legend1 = legend('show');
set(legend1,'FontWeight','normal','FontAngle','normal','FontSize',10);
%grid on;
%
%X3 = [x(3,:) x1(3,:)];
figure2 = figure('Visible','on','Position',[300 300 500 300],'Color','w');
set(0,'DefaultAxesFontName', 'Times New Roman');
axes('Parent',figure2,'FontSize',10);
plot(t,x(3,:),'g-','LineWidth',1.5,'DisplayName','x_3 (Under ADP)');
hold on
plot(t,xc(3,:),'g--','LineWidth',1.5,'DisplayName','x_3 (Unlearned)');
xlabel('Time (s)','FontWeight','normal','FontAngle','normal','FontSize',10);
ylabel('x_3','FontWeight','normal','FontAngle','normal','FontSize',10);
legend1 = legend('show');
set(legend1,'FontWeight','normal','FontAngle','normal','FontSize',10);
%grid on;
%
figure6 = figure('Visible','on','Position',[300 300 500 300],'Color','w');
set(0,'DefaultAxesFontName', 'Times New Roman');
axes('Parent',figure6,'FontSize',10);
plot(t,x(4,:),'k-','LineWidth',1.5,'DisplayName','x_4 (Under ADP)');
hold on
plot(t,xc(4,:),'k--','LineWidth',1.5,'DisplayName','x_4 (Unlearned)');
xlabel('Time (s)','FontWeight','normal','FontAngle','normal','FontSize',10);
ylabel('x_4','FontWeight','normal','FontAngle','normal','FontSize',10);
legend1 = legend('show');
set(legend1,'FontWeight','normal','FontAngle','normal','FontSize',10);
%grid on;
%
for j=1:1:i-1
c1(j) = C(1,j); 
c2(j) = C(2,j); 
c3(j) = C(3,j);
c4(j) = C(4,j); 
c5(j) = C(5,j); 
c6(j) = C(6,j);
c7(j) = C(7,j); 
c8(j) = C(8,j); 
c9(j) = C(9,j);
c10(j) = C(10,j); 
end
k = 1:1:i-1;
figure3 = figure('Visible','on','Position',[300 300 500 300],'Color','w');
set(0,'DefaultAxesFontName', 'Times New Roman');
axes('Parent',figure3,'FontSize',10);
plot(k,c1,'k-','LineWidth',1,'DisplayName','c_{1}');
hold on;
plot(k,c2,'b-','LineWidth',1,'DisplayName','c_{2}');
hold on;
plot(k,c3,'r-','LineWidth',1,'DisplayName','c_{3}');
hold on;
plot(k,c4,'g-','LineWidth',1,'DisplayName','c_{4}');
hold on;
plot(k,c5,'y-','LineWidth',1,'DisplayName','c_{5}');
hold on;
plot(k,c6,'y-*','LineWidth',1,'DisplayName','c_{6}');
hold on;
plot(k,c7,'g-*','LineWidth',1,'DisplayName','c_{7}');
hold on;
plot(k,c8,'b-*','LineWidth',1,'DisplayName','c_{8}');
hold on;
plot(k,c9,'r-*','LineWidth',1,'DisplayName','c_{9}');
hold on;
plot(k,c10,'k-*','LineWidth',1,'DisplayName','c_{10}');
xlabel('Iteration','FontWeight','normal','FontAngle','normal','FontSize',10);
ylabel('c','FontWeight','normal','FontAngle','normal','FontSize',10);
legend1 = legend('show');
set(legend1,'FontWeight','normal','FontAngle','normal','FontSize',10);
set(gca,'xtick',0:10)
%grid on;
for j=1:1:i
w1(j) = W(1,j); 
w2(j) = W(2,j); 
w3(j) = W(3,j); 
w4(j) = W(4,j);
end
k = 1:1:i;

figure4 = figure('Visible','on','Position',[300 300 500 300],'Color','w');
set(0,'DefaultAxesFontName', 'Times New Roman');
axes('Parent',figure4,'FontSize',10);
plot(k,w1,'r-','LineWidth',1,'DisplayName','w_{1}');
hold on;
plot(k,w2,'b-','LineWidth',1,'DisplayName','w_{2}');
hold on;
plot(k,w3,'g-','LineWidth',1,'DisplayName','w_{3}');
hold on;
plot(k,w4,'y-','LineWidth',1,'DisplayName','w_{4}');
hold on;
xlabel('Iteration','FontWeight','normal','FontAngle','normal','FontSize',10);
ylabel('w','FontWeight','normal','FontAngle','normal','FontSize',10);
legend1 = legend('show');
set(legend1,'FontWeight','normal','FontAngle','normal','FontSize',10);
set(gca,'xtick',0:10)
%grid on;

