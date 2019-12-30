clc;clear;
% n=1+0+5+3+0+3+0+6+1;
% a = fix(n/10);
% b = rem(n,10);
% k = max(a,b);
% 
% %% 1-a
% syms x1 x2;
% x1_dot = x2 -(4*x1^2 + x2^2 - 4)*x1;
% x2_dot = -1*x1 -(4*x1^2 + x2^2 - 4)*x2;
% [x1,x2] = solve(x1_dot,x2_dot);
% x = [double(x1(1)) double(x2(1))]
% x_1 = x(1);
% x_2 = x(2);
% 
% %use the first eq. point x = [0 0], and check its stability by linearization
% %use Tylor series, take the terns n<2
% A = [ -12*x_1^2-x_2^2+4  1-2*x_1*x_2; 
%       -1-8*x_1*x_2       -4*x_1^2-3*x_2^2+4
%     ];
% eigen = eig(A)
% if vpa(real(eigen),4)<0
%     stability = "stable";
% elseif vpa(real(eigen(1)),4) >0 | vpa(real(eigen(2)),4) >0
%     plot(x_1,x_2,'*')
%     hold on
%     stability = "unstable";
% else
%     stability = "unknown";
% end
% x
% stability

%% 1-c
% % set Lyapunov
% syms x1 x2;
% V = 0.5*(x1^2 + x2^2);
% V_dot = -1*(4*x1^2+x2^2-4)*(x1^2+x2^2);
% [x1,x2] = solve(V);
% '只有唯一解';

%% 1-c
% %描繪出limit cycle
% r = [0 0;2 2;-0.1 0.4;-2 -2;2 -2;0.1 -0.1]
% x1arr1 = [0,0,0,0]'; %x座標位置初始
% x1arr2 = x1arr1; %y座標位置初始
% for j=1:6
%     x=[r(j,1) r(j,2)]'
%     x1arr1(1) = x(1);
%     x1arr2(1) = x(2);
%     delt = 0.0009
%     x_1 = x(1)
%     x_2 = x(2)
%     for i=1:4000
%         A = [ -4*x_1^2-x_2^2+4  1; 
%                 -1  -4*x_1^2-x_2^2+4
%             ]
%         xN1 = myFindNextPos2(A,x,delt);
%         x1arr1(i+1) = xN1(1);
%         x1arr2(i+1) = xN1(2);
%         x = xN1;
%         x_1 = xN1(1);
%         x_2 = xN1(2);
%     end
%     max(x1arr2)
%     plot(x1arr1,x1arr2,'b');
%     hold on
%     y(j,:) = [x1arr1(4001),x1arr2(4001)]
%     plot(x1arr1(1),x1arr2(1),'o',x1arr1(4001),x1arr2(4001),'x')
% end
% r = [0 0;2 2;-2 2;-2 -2;2 -2;2.5 1]
% legend('','0,0','','','2,2','','','-2,2','','',';-2,-2','','','2,-2','','','2.5,1','')
% axis([-3,3,-3,3])
% hold on
% %ezplot('-4*x^2-y^2+4',[-20 20],[-20 20])
% 
% % 求matlab解一?微分方程?,并?相?.
% % dx/dt=y；
% % dy/dt=-2.6*y^3+0.6*y-0.1*x
% r = [0 0;2 2;-0.1 0.4;-2 -2;2 -2;0.1 -0.1]
% for i =1:6
% xx = [r(i,1) r(i,2)]
% f=@(t,x)([x(2)-(4*x(1)^2+x(2)^2-4)*x(1);-x(1)-(4*x(1)^2+x(2)^2-4)*x(2)]);
% [t,x]=ode45(f,[0 10],xx);
% plot(x(:,1),x(:,2),'-')
% hold on
% len = size(x)
% plot(x(len(1),1),x(len(1),2),'*')
% end
% xlabel('t')

%% 1-d
%描繪出limit cycle
% r = [0 0;2 2;-2 2;-2 -2;2 -2;2.5 1]
% x1arr1 = [0,0,0,0]'; %x座標位置初始
% x1arr2 = x1arr1; %y座標位置初始
% for j=1:6
%     x=[r(j,1) r(j,2)]'
%     x1arr1(1) = x(1);
%     x1arr2(1) = x(2);
%     delt = 0.005
%     x_1 = x(1)
%     x_2 = x(2)
%     for i=1:4000
%         u = (-4-3*x_1^2)
%         A = [ -4*x_1^2-x_2^2+4+u  1; 
%                 -1  -4*x_1^2-x_2^2+4+u
%             ]
%         xN1 = myFindNextPos2(A,x,delt);
%         x1arr1(i+1) = xN1(1);
%         x1arr2(i+1) = xN1(2);
%         x = xN1;
%         x_1 = xN1(1);
%         x_2 = xN1(2);
%     end
%     figure(2);
%     max(x1arr2)
%     plot(x1arr1,x1arr2,'b');
%     hold on
%     y(j,:) = [x1arr1(4001),x1arr2(4001)]
%     plot(x1arr1(1),x1arr2(1),'o',x1arr1(4001),x1arr2(4001),'x')
% end
% r = [0 0;2 2;-2 2;-2 -2;2 -2;2.5 1]
% legend('','0,0','','','2,2','','','-2,2','','',';-2,-2','','','2,-2','','','2.5,1','')
% axis([-3,3,-3,3])
%% test
r = [2 -2;-1 1]
x1arr1 = [0,0,0,0]'; %x座標位置初始
x1arr2 = x1arr1; %y座標位置初始
theta = 0.1
for j=1:2
    x=[r(j,1) r(j,2)]'
    x1arr1(1) = x(1);
    x1arr2(1) = x(2);
    delt = 0.002
    x_1 = x(1)
    x_2 = x(2)
    for i=1:5000
        B = [0;x_1+1];
        u = -1*(x_1*x_2+theta*x_2^4)/(x_2*(x_1+1))-0.1*x_2*(x_1+1)
        if x_1==-1
            u = 0.003
        end
        A = [ 0  1; 
              0 theta*x_2^2
            ]
        xN1 = myFindNextPos2_u(A,x,delt,B,u);
        x1arr1(i+1) = xN1(1);
        x1arr2(i+1) = xN1(2);
        x = xN1;
        x_1 = xN1(1);
        x_2 = xN1(2);
    end
    figure(2);
    max(x1arr2)
    plot(x1arr1,x1arr2,'b');
    hold on
    y(j,:) = [x1arr1(i),x1arr2(i)]
    plot(x1arr1(1),x1arr2(1),'o',x1arr1(i),x1arr2(i),'x')
end
axis([-3,3,-3,3])