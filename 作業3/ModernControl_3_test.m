clear all
clc

hold on
%% 1
% sys=inline('[x(2)-(4*x(1)^2+x(2)^2-4)*x(1);-x(1)-(4*x(1)^2+x(2)^2-4)*x(2)]','t', 'x');
% vectorfield(sys,-3:.1:3,-5:0.5:5);
% f=@(t,x)([x(2)-(4*x(1)^2+x(2)^2-4)*x(1);-x(1)-(4*x(1)^2+x(2)^2-4)*x(2)]);
% [t,xs] = ode45(f,[0 30],[1 1]);
% plot(xs(:,1),xs(:,2),'b')      
% hold off
% axis([-3 3 -5 5])
% fsize=15;
% set(gca,'XTick',-3:1:3,'FontSize',fsize)
% set(gca,'YTick',-5:1:5,'FontSize',fsize)
% xlabel('x1(t)','FontSize',fsize)
% ylabel('x2(t)','FontSize',fsize)
% hold off
%% 2
% sys=inline('[x(2);-x(1)-x(2)*((x(1))^2-1)]','t', 'x');
% vectorfield(sys,-3:.3:3,-5:0.5:5);
% f=@(t,x)([x(2);-x(1)-x(2)*((x(1))^2-1)]);
% [t,xs] = ode45(f,[0 30],[2 3]);
% plot(xs(:,1),xs(:,2))      
% hold off
% axis([-3 3 -5 5])
% fsize=15;
% set(gca,'XTick',-3:1:3,'FontSize',fsize)
% set(gca,'YTick',-5:1:5,'FontSize',fsize)
% xlabel('x(t)','FontSize',fsize)
% ylabel('x2(t)','FontSize',fsize)
% hold off
%% 3
% sys=inline('[-1*x(2)+(1-(x(1)^2+x(2)^2)^0.5)*x(1);x(1)+(1-(x(1)^2+x(2)^2)^0.5)*x(2)]','t', 'x');
% vectorfield(sys,-3:.3:3,-5:0.5:5);
% f=@(t,x)([-1*x(2)+(1-(x(1)^2+x(2)^2)^0.5)*x(1);x(1)+(1-(x(1)^2+x(2)^2)^0.5)*x(2)]);
% [t,xs] = ode45(f,[0 30],[1.5 0]);
% plot(xs(:,1),xs(:,2),'b')      
% hold off
% axis([-3 3 -3 3])
% fsize=15;
% set(gca,'XTick',-3:1:3,'FontSize',fsize)
% set(gca,'YTick',-5:1:5,'FontSize',fsize)
% xlabel('x(t)','FontSize',fsize)
% ylabel('x2(t)','FontSize',fsize)
% hold off
%% 4
% sys=inline('[x(2)+(10-x(1)^4-2*x(2)^2)*x(1)^7;x(1)^3+(10-x(1)^4-2*x(2)^2)*x(2)^5*3]','t', 'x');
% vectorfield(sys,-3:.3:3,-5:0.5:5);
% f=@(t,x)([x(2)+(10-x(1)^4-2*x(2)^2)*x(1)^7;x(1)^3+(10-x(1)^4-2*x(2)^2)*x(2)^5*3]);
% [t,xs] = ode45(f,[0 30],[6 6]);
% plot(xs(:,1),xs(:,2),'b')      
% hold off
% axis([-3 3 -3 3])
% fsize=15;
% set(gca,'XTick',-3:1:3,'FontSize',fsize)
% set(gca,'YTick',-5:1:5,'FontSize',fsize)
% xlabel('x(t)','FontSize',fsize)
% ylabel('x2(t)','FontSize',fsize)
% hold off
%% 5
% sys=inline('[2*x(2)+(x(1)^2+x(2)^4)*x(1);-2*x(1)+(x(1)^2+x(2)^4)*x(2)]','t', 'x');
% vectorfield(sys,-3:.3:3,-5:0.5:5);
% f=@(t,x)([2*x(2)+(x(1)^2+x(2)^4)*x(1);-2*x(1)+(x(1)^2+x(2)^4)*x(2)]);
% [t,xs] = ode45(f,[0 30],[0.2 0.2]);
% plot(xs(:,1),xs(:,2),'b')      
% hold off
% axis([-3 3 -3 3])
% fsize=15;
% set(gca,'XTick',-3:1:3,'FontSize',fsize)
% set(gca,'YTick',-5:1:5,'FontSize',fsize)
% xlabel('x(t)','FontSize',fsize)
% ylabel('x2(t)','FontSize',fsize)
% hold off
%% 6
theta = 0.1
u = 1
sys=inline('[x(2);0.1*x(2)^3+(x(1)+1)]','t', 'x');
vectorfield(sys,-3:.3:3,-5:0.5:5);
f=@(t,x)([x(2);0.1*x(2)^3+(x(1)+1)]);
[t,xs] = ode45(f,[0 30],[-2 0]);
plot(xs(:,1),xs(:,2),'b')      
hold off
axis([-3 3 -3 3])
fsize=15;
set(gca,'XTick',-3:1:3,'FontSize',fsize)
set(gca,'YTick',-5:1:5,'FontSize',fsize)
xlabel('x(t)','FontSize',fsize)
ylabel('x2(t)','FontSize',fsize)
hold off