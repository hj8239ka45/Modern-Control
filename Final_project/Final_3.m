clc;clear;
%% final
%MRAC
delt = 0.01;
totTime = 130;
totalStep = totTime/delt ;
tarr= [0 : 1 : totalStep]*delt;
x = [0;0;0];
xm = [0;0;0];
%
a1=-12; a2=-4; a3=-3;
%pole assignment ¿ï¥Îpole:-2 -5 -8
pole=[-2 -5 -8];
am = conv([1 -pole(1)],conv([1 -pole(2)],[1 -pole(3)]));
am1=-am(4); am2=-am(3); am3=-am(2);
bm = 1;b = 1;
A  = [  0   1   0;
        0   0   1;
       a1  a2  a3];
Am = [  0   1   0;
        0   0   1;
      am1 am2 am3];
B = [0;0;b];
Bm = [0;0;bm];

gama1 = 1;
gama2 = 0.5;
gama3 = 4;
gama4 = 5;
Q=[0.001 0 0;0 0.001 0;0 0 2000];
P = lyap(Am,Q)

theta(:,1)=[0;0;0;0];
xarr1 = zeros(totalStep+1,1);xarr2 = xarr1;xarr3 = xarr1;
xmarr1 = zeros(totalStep+1,1);xmarr2 = xmarr1;xmarr3 = xmarr1;

xarr1(1) = x(1);xarr2(1) = x(2);
x_1 = xarr1(1);x_2 = xarr2(1);x_3 = xarr3(1);

xmarr1(1) = xm(1);xmarr2(1) = xm(2);
xm_1 = xmarr1(1);xm_2 = xmarr2(1);xm_3 = xmarr3(1);

for i=1:totalStep
    k = i;
    %r(k) = 1;
    r(k)= 1;
    u(k) = theta(1,k)*r(k) + theta(2,k)*x_1 + theta(3,k)*x_2 + theta(4,k)*x_3;
    
    %Xm (Mode)
    xm_dot = Am*xm + Bm*r(k);
    xmN = xm + xm_dot*delt;
    xmarr1(i+1) = xmN(1);xmarr2(i+1) = xmN(2);xmarr3(i+1) = xmN(3);
    xm = xmN;
    xm_1 = xmN(1);xm_2 = xmN(2);xm_3 = xmN(3);
    
    %X
    x_dot = A*x + B*u(k);
    xN = x + x_dot*delt;
    xarr1(i+1) = xN(1);xarr2(i+1) = xN(2);xarr3(i+1) = xN(3);
    x = xN;
    x_1 = xN(1);x_2 = xN(2);x_3 = xN(3);
    
    %E
    e_1 = xm_1-x_1;
    e_2 = xm_2-x_2;
    e_3 = xm_3-x_3;
    e(:,i)=[e_1;e_2;e_3];
    %cal
    zeta = 0.5*( P(1,3)*e_1+P(2,3)*e_2+P(3,3)*e_3 );
    Z(i) = zeta;
    theta(1,k+1) = theta(1,k) + delt*(zeta*r(k))/(b*gama1);
    theta(2,k+1) = theta(2,k) + delt*(zeta*x_1)/(b*gama2);
    theta(3,k+1) = theta(3,k) + delt*(zeta*x_2)/(b*gama3);
    theta(4,k+1) = theta(4,k) + delt*(zeta*x_3)/(b*gama4);
end
figure(1)
hold on;
subplot(3,1,1)
plot(tarr,xarr1,'b',tarr,xmarr1,'r')
xlabel('x_1');ylabel('x_m_1');
legend('x','xm')
subplot(3,1,2)
plot(tarr,xarr2,'b',tarr,xmarr2,'r')
xlabel('x_2');ylabel('x_m_2');
legend('x','xm')
subplot(3,1,3)
plot(tarr,xarr3,'b',tarr,xmarr3,'r')
xlabel('x_3');ylabel('x_m_3');
legend('x','xm')

% figure(2)
% subplot(3,1,1)
% hold on;
% plot(tarr(1:3000),xarr1(1:3000),'g',tarr(1:3000),xmarr1(1:3000),'r')
% xlabel('x_1');ylabel('x_m_1');
% legend('x','xm')
% subplot(3,1,2)
% hold on;
% plot(tarr(1:3000),xarr2(1:3000),'g',tarr(1:3000),xmarr2(1:3000),'r')
% xlabel('x_2');ylabel('x_m_2');
% legend('x','xm')
% subplot(3,1,3)
% hold on;
% plot(tarr(1:3000),xarr3(1:3000),'g',tarr(1:3000),xmarr3(1:3000),'r')
% xlabel('x_3');ylabel('x_m_3');
% legend('x','xm')

figure(2)
hold on;
plot(tarr,theta(4,:),'r');
plot(tarr,theta(3,:),'g');
plot(tarr,theta(2,:),'b');
plot(tarr,theta(1,:),'y');
xlabel('Time');ylabel('theta');
title('Q_3_3=2000')
legend('theta4','theta3','theta2','theta1')