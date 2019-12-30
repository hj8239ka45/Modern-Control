clc;clear;
%% main code.
%EX:STC
%% 1-a
% y(1) = 0;y(2) = 0;
% u(1) = 0;u(2) = 0;
% delt = 0.1;
% totTime = 10;
% totalStep = totTime/delt ;
% tarr= [0 : 1 : totalStep]*delt;
% for i=1:totalStep
%     k = i+2;
%     %u(k) = 1;
%     u(k) = (0.3*sin(6*k/20) + 0.5*sin(6*k/15+3.2) + 0.2*sin(2.57*k/15+1.63))*1;
%     d = 0.02*(rand-0.5);
%     y(k) = -0.3*y(k-1) + 0.8*y(k-2) + 0.9*u(k-1) + 0.6*u(k-2) + d;
% end
% plot(y)
% legend('u : input.')

%% 1-b
% len = length(u);
% tmp = 0;
% tmp2 = 0;
% for i=4:len
%     phi = zeros(4,1);
%     phi(1) = y(i-1);
%     phi(2) = y(i-2);
%     phi(3) = u(i-1);
%     phi(4) = u(i-2);
%     tmp = tmp + phi*phi';
%     tmp4(:,:,i) = tmp;
%     tmp2 = tmp2 + y(i)*phi;
% end
% tmp3 = inv(tmp);
% %[-a1 -a2 b1 b2]
% theta = tmp3*tmp2
% a1 = -theta(1);
% a2 = -theta(2);
% b1 = theta(3);
% b2 = theta(4);

%% 1-c
% syms alpha beta0 beta1
% sol1 = alpha + a1 + beta0*b1 - 1.82;
% sol2 = alpha*a1 + a2 + beta1*b1 + beta0*b2 - 1.07;
% sol3 = alpha*a2 + beta1*b2 - 0.205;
% [alpha beta0 beta1] = solve(sol1,sol2,sol3);
% Alpha = double(alpha)
% Beta0 = double(beta0)
% Beta1 = double(beta1)
% r=u;
% %開路等校
% for k=totalStep:1000
%     %r(k) = 1;
%     r(k) = (0.3*sin(6*k/20) + 0.5*sin(6*k/15+3.2) + 0.2*sin(2.57*k/15+1.63))*1;
%     d = 0.02*(rand-0.5);
%     y(k) = -(Alpha+a1+Beta0*b1)*y(k-1) - (Alpha*a1+a2+Beta1*b1+Beta0*b2)*y(k-2) - (Alpha*a2+Beta1*b2)*y(k-3) + (Beta0*b1)*r(k-1) + (Beta1*b1+Beta0*b2)*r(k-2) + (Beta1*b2)*r(k-3) + d;
% end
% %閉路等校
% % for k=totalStep:1000
% %     %r(k+1) = 1;
% %     r(k+1)=(0.3*sin(6*k/20) + 0.5*sin(6*k/15+3.2) + 0.2*sin(2.57*k/15+1.63))*1;
% %     e(k)=r(k)-y(k);
% %     u(k)=(-Alpha*u(k-1)+Beta0*e(k)+Beta1*e(k-1));
% %     d = 0.02*(rand-0.5);
% %     y(k+1)=-a1*y(k)-a2*y(k-1)+b1*u(k)+b2*u(k-1)+d;
% % end 
% figure()
% %plot(y,'r')
% hold on;
% plot(r,'g')
% plot(y,'b')
% xlabel('Data');ylabel('Amp.');
% legend('input','output')
% figure()
% plot(r-y)
% xlabel('Data');ylabel('Amp.');
% title('Error');

%% 1-d: STC on line
y(1) = 0;y(2) = 0;
u(1) = 0;u(2) = 0;
delt = 0.1;
totTime = 150;
totalStep = totTime/delt ;
tarr= [0 : 1 : totalStep]*delt;
for i=1:totalStep
    k = i+2;
    r(k) = 1;
    %r(k) = 0.3*sin(6*k/20) + 0.5*sin(6*k/15+3.2) + 0.2*sin(2.57*k/15+1.63);
    d = 0.01*(rand-0.5);
    if i<6
        y(k) = -0.3*y(k-1) + 0.8*y(k-2) + 0.9*r(k-1) + 0.6*r(k-2) + d;
        u(k) = r(k);
    else
        r(k+1) = 1;
        %r(k+1)=(0.3*sin(6*k/20) + 0.5*sin(6*k/15+3.2) + 0.2*sin(2.57*k/15+1.63))*1;
        e(k-1)=r(k-1)-y(k-1);
        u(k-1)=(-Alpha*u(k-2)+Beta0*e(k-1)+Beta1*e(k-2));
        d = 0.02*(rand-0.5);
        y(k)=-a1*y(k-1)-a2*y(k-2)+b1*u(k-1)+b2*u(k-2)+d;
    end
    if i>4 && i<900
        theta = findtheta(u,y);
        a1 = -theta(1);
        a2 = -theta(2);
        b1 = theta(3);
        b2 = theta(4);
        syms alpha beta0 beta1;
        sol1 = alpha + a1 + beta0*b1 - 1.82;
        sol2 = alpha*a1 + a2 + beta1*b1 + beta0*b2 - 1.07;
        sol3 = alpha*a2 + beta1*b2 - 0.205;
        [alpha beta0 beta1] = solve(sol1,sol2,sol3);
        Alpha = double(alpha);
        Beta0 = double(beta0);
        Beta1 = double(beta1);
    end
end
plot(y)
legend('u : input.')

function [theta]=findtheta(u,y)
    len = length(u);
    tmp = 0;
    tmp2 = 0;
    for i=4:len
        phi = zeros(4,1);
        phi(1) = y(i-1);
        phi(2) = y(i-2);
        phi(3) = u(i-1);
        phi(4) = u(i-2);
        tmp = tmp + phi*phi';
        tmp2 = tmp2 + y(i)*phi;
    end
    tmp3 = inv(tmp);
    %[-a1 -a2 b1 b2]
    theta = tmp3*tmp2;
end