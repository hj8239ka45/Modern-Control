clc;clear;
%% main code
% k:const. -->會出現顫振 k:s -->漸進線
K = 4000;%550<x<1730 or 3985<x:收斂  3985>x>1730 or 550>x:發散
delt = 0.0001;
totTime = 10;
totalStep = totTime/delt ;
tarr= [0 : 1 : totalStep]*delt;

x = [0 4 0]'
%(xarra1,xarra2) : 原本的系統
xarr1 = zeros(totalStep+1,1);xarr2 = xarr1;xarr3 = xarr1;  %x座標位置初始 %y座標位置初始
xarr1(1) = x(1);xarr2(1) = x(2);xarr3(1) = x(3);
x_1 = xarr1(1);x_2 = xarr2(1);x_3 = xarr3(1);
Bx = [0;0;1];
for i=1:totalStep
    %get random of alpha, the range is 1~1.1
    alpha = 1 + rand*0.1;
    tmp1 = (alpha*x_1*sin(x_2)+cos(x_3));
    tmp2 = (alpha*x_2*sin(x_3));
    tmp3 = (x_3^2*cos(x_3));
    Ax = [ 0  1  0; 
           0  0  1;
           tmp1 tmp2 tmp3
        ];
    A = 1;
    B = 4;
    C = 4;
    %二次曲線 D^2 + 8*D + 7 -> s = -7 & -1 ->進入平面(D^2+8*D+7)後以二皆系統進去0,0
    s = A*x_3 + B*x_2 + C*x_1;
    if s>0
        if s>=1
            k = K;
        else  %註解為k=k 解掉註解為k=K*s
            k = K*s;
        end
    else
        if s<=-1
            k = -1*K;
        else  %註解為k=k 解掉註解為k=K*s
            k = K*s;
        end
    end
    ss(i+1) = s;
    kk(i+1) = k;
    ux = A*(tmp1*x_1 + tmp2*x_2 + tmp3*x_3) - (B*(x_3) + C*(x_2) +k);
    %馬達驅動飽和
%     if ux>2200
%         ux = 2200;
%     elseif ux<-2200
%         ux = -2200;
%     end
    uu(i+1) = ux;
    xNew = zeros(size(x));
    ut = Bx*ux;
    dt = 0.4*rand()-0.2;%輸入的干擾訊號
    x_dot = Ax*x + ut + dt;
    xNew = x + x_dot*delt;
    xN = xNew;
    
    xarr1(i+1) = xN(1);xarr2(i+1) = xN(2);xarr3(i+1) = xN(3);
    x = xN;
    x_1 = xN(1);x_2 = xN(2);x_3 = xN(3);
end
figure(1);plot(tarr,xarr1,'-r',tarr,xarr2,'-g',tarr,xarr3,'-b');legend('x1','x2','x3');
xlabel('Time');ylabel('x');
figure(2)
plot3(xarr1,xarr2,xarr3,'-b');hold on;
plot3(xarr1(1),xarr2(1),xarr3(1),'o',xarr1(i+1),xarr2(i+1),xarr3(i+1),'x');
%axis([-5,5,-2,20,-5,5]);
xlabel('x1');ylabel('x2');zlabel('x3');
%plane
% pointA = [50,-50,50];pointB = [-64,56,0];pointC = [-50,50,-50];pointD = [64,-56,0];
% points=[pointA' pointB' pointC' pointD']; % using the data given in the question
% fill3(points(1,:),points(2,:),points(3,:),'r')
% grid on
% alpha(0.1)

% view([0,-86.7]);
figure(3)
subplot(3,1,1);
plot(tarr,uu,'-b');
xlabel('Time');ylabel('u');
subplot(3,1,2);
plot(tarr,kk,'-b');
xlabel('Time');ylabel('k');
subplot(3,1,3);
one = ones(1,totalStep+1);
minusone = -1*ones(1,totalStep+1);
plot(tarr,ss,'-b',tarr,one,'g',tarr,minusone,'g');
legend('s','up layer','low layer');
xlabel('Time');ylabel('s');

figure(4)
subplot(3,1,1);
plot(xarr1,xarr2,'-b');hold on;
plot(xarr1(1),xarr2(1),'o',xarr1(i+1),xarr2(i+1),'x');
xlabel('x1');ylabel('x2');
subplot(3,1,2);
plot(xarr2,xarr3,'-b');hold on;
plot(xarr2(1),xarr3(1),'o',xarr2(i+1),xarr3(i+1),'x');
xlabel('x2');ylabel('x3');
subplot(3,1,3);
plot(xarr1,xarr3,'-b');hold on;
plot(xarr1(1),xarr3(1),'o',xarr1(i+1),xarr3(i+1),'x');
xlabel('x1');ylabel('x3');