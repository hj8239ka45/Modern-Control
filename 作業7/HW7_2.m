clc;clear;
%% main code.
%MRAC
delt = 0.01;
totTime = 100;
totalStep = totTime/delt ;
tarr= [0 : 1 : totalStep]*delt;
x = [0;0];
xm = [0;0];
%
am1=-2; am2=-3; a1=0.4; a2=1.8;
bm = 2;b = 1;
Am = [  0   1;
      am1 am2];
A = [  0   1;
      a1  a2];
Bm = [0;bm];
B = [0;b];

gama1 = 1;
gama2 = 0.5;
gama3 = 4;
Q=[1 0;0 1000];
P = lyap(Am,Q)

theta(:,1)=[0;0;0];
xarr1 = zeros(totalStep+1,1);xarr2 = xarr1;
xmarr1 = xarr1;xmarr2 = xmarr1;
earr1 = xarr1;earr2 = earr1;

xarr1(1) = x(1);xarr2(1) = x(2);
x_1 = xarr1(1);x_2 = xarr2(1);

xmarr1(1) = xm(1);xmarr2(1) = xm(2);
xm_1 = xmarr1(1);xm_2 = xmarr2(1);

for i=1:totalStep
    k = i;
    r(k+1) = 1;
    %r(k+1)=sin(0.5*k*delt)+0.3*cos(2*k*delt+4);
    u(k+1) = theta(1,k)*r(k) + theta(2,k)*x_1 + theta(3,k)*x_2;
    
    %Xm (Mode)
    xm_dot = Am*xm + Bm*r(k);
    xmN = xm + xm_dot*delt;
    xmarr1(i+1) = xmN(1);xmarr2(i+1) = xmN(2);
    xm = xmN;
    xm_1 = xmN(1);xm_2 = xmN(2);
    
    %X
    x_dot = A*x + B*u(k);
    xN = x + x_dot*delt;
    xarr1(i+1) = xN(1);xarr2(i+1) = xN(2);
    x = xN;
    x_1 = xN(1);x_2 = xN(2);
    
    %E
    e_1 = xm_1-x_1;
    e_2 = xm_2-x_2;
    %cal
    zeta = 0.5*(P(1,2)*e_1+P(2,2)*e_2);
    theta(1,k+1) = theta(1,k) + delt*(zeta*r(k))/(b*gama1);
    theta(2,k+1) = theta(2,k) + delt*(zeta*x_1)/(b*gama2);
    theta(3,k+1) = theta(3,k) + delt*(zeta*x_2)/(b*gama3);
end
figure(1)
subplot(2,1,1)
plot(tarr,xarr1,'b',tarr,xmarr1,'r')
xlabel('x_1');ylabel('x_m_1');
legend('x','xm')
subplot(2,1,2)
plot(tarr,xarr2,'b',tarr,xmarr2,'r')
xlabel('x_2');ylabel('x_m_2');
legend('x','xm')
figure(2)
plot(tarr,xmarr1-xarr1,'b',tarr,xmarr2-xarr2,'r')
xlabel('Time');ylabel('Error');
legend('e1','e2')
figure(3)
plot(tarr,u,'b',tarr,r,'r')
xlabel('Time');ylabel('Input');
legend('u','r')
figure(4)
plot(tarr,theta(1,:),'b',tarr,theta(2,:),'r',tarr,theta(3,:),'g')
xlabel('Time');ylabel('Theta');
legend('theta0','theta1','theta2')