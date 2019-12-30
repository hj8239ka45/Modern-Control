%Feedback Linearization
clc;clear;close all;
%% Student ID
n=1+0+5+3+0+3+0+6+1;
a = fix(n/10);
b = rem(n,10);
%% 
pole = [-a+b*j -a-b*j -a]
%%
% main_code
% delt = 0.0001;
% totTime = 10 ;
% totalStep = totTime/delt ;
% tarr= [0 : 1 : totalStep]*delt;
% 
% x = [2 -1]'
% %(xarra1,xarra2) : 原本的系統
% xarr1 = [0,0,0,0]';xarr2 = xarr1;  %x座標位置初始 %y座標位置初始
% xarr1(1) = x(1);  xarr2(1) = x(2);
% y = x(1)
% %(zarra1,zarra2) : 建立可線性回饋的轉換後系統
% zarr1 = [0,0,0,0]';zarr2 = zarr1;  %x座標位置初始 %y座標位置初始
% zarr1(1) = x(1);  zarr2(1) = x(1)^2+x(2);
% x_1 = xarr1(1); x_2 = xarr2(1);
% z_1 = zarr1(1); z_2 = zarr2(1);
% Bx = [0;1]
% for i=1:totalStep
%     Ax = [ x_1  1; 
%           -1  0
%         ]
%     ux =  -1*(2*x_1^3 + 2*x_1*x_2 - x_1 + 82*z_1 + 2*z_2);
%     xN = myFindNextPos2_u(Ax,x,delt,Bx,ux);
%     xarr1(i+1) = xN(1);xarr2(i+1) = xN(2);
%     x = xN;
%     x_1 = xN(1);x_2 = xN(2);
%     z_1 = x_1; z_2 = x_1^2+x_2;
%     zarr1(i+1) = z_1;zarr2(i+1) = z_2;
% end
% figure();plot(tarr,xarr1,'-r',tarr,xarr2,'-b');legend('x1','x2');xlabel('Time(s)');ylabel('x data');
% figure();plot(tarr,zarr1,'-r',tarr,zarr2,'-b');legend('z1','z2');xlabel('Time(s)');ylabel('z data');
% figure()
% plot(xarr1,xarr2,'-b');hold on;
% plot(xarr1(1),xarr2(1),'o',xarr1(i+1),xarr2(i+1),'x');
% xlabel('x1');ylabel('x2');
% figure()
% plot(zarr1,zarr2,'-b');hold on;
% plot(zarr1(1),zarr2(1),'o',zarr1(i+1),zarr2(i+1),'x');
% xlabel('z1');ylabel('z2');

%% 1-2
% delt = 0.0001;
% totTime = 10 ;
% totalStep = totTime/delt ;
% tarr= [0 : 1 : totalStep]*delt;
% 
% x = [2 -1 -3]'
% xarr1 = [0,0,0,0]';xarr2 = xarr1;xarr3 = xarr1;
% xarr1(1) = x(1);  xarr2(1) = x(2);  xarr3(1) = x(3);
% y(1) = x(1);
% zarr1 = [0,0,0,0]';zarr2 = zarr1;zarr3 = zarr1;
% zarr1(1) = x(1);  zarr2(1) = x(1)^3+x(2);  zarr3(1) = 3*x(1)^5+3*x(1)^2*x(2)+x(3);
% x_1 = xarr1(1); x_2 = xarr2(1); x_3 = xarr3(1);
% z_1 = zarr1(1); z_2 = zarr2(1); z_3 = zarr3(1);
% z = [z_1 z_2 z_3]';
% Bx = [0;0;1];
% for i=1:totalStep
%     Ax = [ x_1^2  1  0;
%           0       0  1;
%           0       0  0
%         ];
%     ux =  -1*(15*x_1^7 + 21*x_1^4*x_2 + 6*x_1*x_2^2 + 3*x_1^2*x_3 + 82*z_1 + 84*z_2 + 3*z_3);
%     xN = myFindNextPos2_u(Ax,x,delt,Bx,ux);
%     xarr1(i+1) = xN(1);xarr2(i+1) = xN(2);xarr3(i+1) = xN(3);
%     x = xN;
%     x_1 = xN(1);x_2 = xN(2);x_3 = xN(3);
% 
%     z_1 = x_1; z_2 = x_1^3+x_2; z_3 = 3*x_1^5+3*x_1^2*x_2+x_3;
%     zarr1(i+1) = z_1;zarr2(i+1) = z_2;zarr3(i+1) = z_3;
%     y(i+1) = z_1;
% end
% figure()
% plot(tarr,y,'-b');xlabel('Time(s)');ylabel('y data');
%% 1-3
%setting
dth1 = -2;dth2 = -0.5;
totTime = 10 ;
x = [2 -1]';

delt = 0.0001;
totalStep = totTime/delt ;
tarr= [0 : 1 : totalStep]*delt;

theta1 = 7;theta2 = 2;
theta_1 = theta1;theta_2 = theta2;

% no error
xarr1 = [0,0,0,0]';xarr2 = xarr1;
xarr1(1) = x(1);  xarr2(1) = x(2);
y(1) = x(1);
zarr1 = [0,0,0,0]';zarr2 = zarr1;
zarr1(1) = x(1);  zarr2(1) = 0.5*x(1)^3+(theta_1)*x(2);
x_1 = xarr1(1); x_2 = xarr2(1);
z_1 = zarr1(1); z_2 = zarr2(1);
z = [z_1 z_2]';
Bx = [0;1];
for i=1:totalStep
    Ax = [ -0.5*x_1^2  (theta_1);
          0       (theta_2)*x_1
        ];
    ux = -(-0.75*x_1^5 - 1.5*theta1*x_1^2*x_2 + theta1*theta2*x_1*x_2 + 82*z_1 + 2*z_2)/(theta1);
    xN = myFindNextPos2_u(Ax,x,delt,Bx,ux);
    xarr1(i+1) = xN(1);xarr2(i+1) = xN(2);
    x = xN;
    x_1 = xN(1);x_2 = xN(2);

    z_1 = x_1; z_2 = 0.5*x_1^3+(theta_1)*x_2;
    zarr1(i+1) = z_1;zarr2(i+1) = z_2;
    y(i+1) = z_1;
end


theta_1 = theta1+dth1;theta_2 = theta2+dth2;
x_e = [2 -1]';
% with error
xarr1_e = [0,0,0,0]';xarr2_e = xarr1_e;
xarr1_e(1) = x_e(1);  xarr2_e(1) = x_e(2);
y_e(1) = x_e(1);
zarr1_e = [0,0,0,0]';zarr2_e = zarr1_e;
zarr1_e(1) = x_e(1);  zarr2_e(1) = 0.5*x_e(1)^3+(theta_1)*x_e(2);
x_1_e = xarr1_e(1); x_2_e = xarr2_e(1);
z_1_e = zarr1_e(1); z_2_e = zarr2_e(1);
z = [z_1_e z_2_e]';
Bx = [0;1];
for i=1:totalStep
    Ax = [ -0.5*x_1_e^2  (theta_1);
          0      (theta_2)*x_1_e
        ];
    ux = -(-0.75*x_1_e^5 - 1.5*theta1*x_1_e^2*x_2_e + theta1*theta2*x_1_e*x_2_e + 82*z_1_e + 2*z_2_e)/(theta1);
    uu2(i+1) = 1.5*dth1*x_1_e^2*x_2_e + (dth1*theta2 - dth2*theta1 -dth1*dth2)*x_1_e*x_2_e + dth1*ux;
    xN = myFindNextPos2_u(Ax,x_e,delt,Bx,ux);
    xarr1_e(i+1) = xN(1);xarr2_e(i+1) = xN(2);
    x_e = xN;
    x_1_e = xN(1);x_2_e = xN(2);

    z_1_e = x_1_e; z_2_e = 0.5*x_1_e^3 + (theta_1)*x_2_e;
    zarr1_e(i+1) = z_1_e;zarr2_e(i+1) = z_2_e;
    y_e(i+1) = z_1_e;
end
figure()
plot(tarr,uu2);xlabel('Time(s)');ylabel('the influence of thrta error');
figure()
plot(tarr,y,'-r',tarr,y_e,'-b');xlabel('Time(s)');ylabel('y data');legend('no error','with error')
figure()
plot(xarr1,xarr2,'-r',xarr1_e,xarr2_e,'-b');xlabel('x1');ylabel('x2');legend('no error','with error')
figure()
plot(zarr1,zarr2,'-r',zarr1_e,zarr2_e,'-b');xlabel('z1');ylabel('z2');legend('no error','with error')


% delt = 0.0001;
% totTime = 5 ;
% totalStep = totTime/delt ;
% tarr= [0 : 1 : totalStep]*delt;
% 
% x = [2 -1 -3]'
% xarr1 = [0,0,0,0]';xarr2 = xarr1;xarr3 = xarr1;
% xarr1(1) = x(1);  xarr2(1) = x(2);  xarr3(1) = x(3);
% y(1) = x(1);
% zarr1 = [0,0,0,0]';zarr2 = zarr1;zarr3 = zarr1;
% zarr1(1) = x(1);  zarr2(1) = x(1)^3+x(2);  zarr3(1) = 3*x(1)^5+3*x(1)^2*x(2)+x(3);
% x_1 = xarr1(1); x_2 = xarr2(1); x_3 = xarr3(1);
% z_1 = zarr1(1); z_2 = zarr2(1); z_3 = zarr3(1);
% z = [z_1 z_2 z_3]';
% Bx = [0;0;1];
% for i=1:totalStep
%     Ax = [ x_1^2  1  0;
%           0       0  1;
%           0       0  0
%         ];
%     ux =  -1*(15*x_1^7 + 21*x_1^4*x_2 + 6*x_1*x_2^2 + 3*x_1^2*x_3 + 82*z_1 + 84*z_2 + 3*z_3);
%     xN = myFindNextPos2_u(Ax,x,delt,Bx,ux);
%     xarr1(i+1) = xN(1);xarr2(i+1) = xN(2);xarr3(i+1) = xN(3);
%     x = xN;
%     x_1 = xN(1);x_2 = xN(2);x_3 = xN(3);
%     
%     Az = [ 0  1 0;
%            0  0 1;
%            -82 -84 -3
%         ];
%     zN = myFindNextPos2(Az,z,delt);
%     zarr1(i+1) = zN(1);zarr2(i+1) = zN(2);zarr3(i+1) = zN(3);
%     z = zN;
%     z_1 = zN(1); z_2 = zN(2); z_3 = zN(3);
%     y(i+1) = z_1;
% end
% figure()
% plot(tarr,y,'-b');