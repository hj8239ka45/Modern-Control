clc;clear;close all;
%% Student ID
n=1+0+5+3+0+3+0+6+1;
a = fix(n/10);
b = rem(n,10);
%% 
pole = [-a+b*j -a*b*j -a]
r = [0 0;2 2;-0.1 0.4;-2 -2;2 -2;0.1 -0.1]
%% main_code
%time
delt = 0.0001;
totTime = 5 ;
totalStep = totTime/delt ;
tarr= [0 : 1 : totalStep]*delt;

x = [9 -1]'
%(xarra1,xarra2) : 原本的系統
xarr1 = [0,0,0,0]';xarr2 = xarr1;  %x座標位置初始 %y座標位置初始
xarr1(1) = x(1);  xarr2(1) = x(2);
y = x(1)
%(zarra1,zarra2) : 建立可線性回饋的轉換後系統
zarr1 = [0,0,0,0]';zarr2 = xarr1;  %x座標位置初始 %y座標位置初始
zarr1(1) = x(1);  zarr2(1) = x(2)+x(2)^3;
x_1 = xarr1(1); x_2 = xarr2(1);
z_1 = zarr1(1); z_2 = zarr2(1);
z = [z_1 z_2]'
Bx = [0;1]
for i=1:totalStep
    Ax = [ 0  1+x_2^2; 
          0  0
        ];
    ux = (1/(1+3*x_2^2))*(-5*x_1-2*x_2-2*x_2^3);
    xN = myFindNextPos2_u(Ax,x,delt,Bx,ux);
    xarr1(i+1) = xN(1);xarr2(i+1) = xN(2);
    x = xN;
    x_1 = xN(1);x_2 = xN(2);
    
    Az = [ 0  1;
          -5 -2
        ];
    zN = myFindNextPos2(Az,z,delt);
    zarr1(i+1) = zN(1);zarr2(i+1) = zN(2);
    z = zN;
    z_1 = zN(1); z_2 = zN(2);
    y1(i+1) = x_1;
    y2(i+1) = z_1;
end
figure(); plot(tarr,y1,'r',tarr,y2,'b')
figure()
plot(xarr1,xarr2,'-b');hold on;
plot(xarr1(1),xarr2(1),'o',xarr1(i+1),xarr2(i+1),'x');axis([-3,3,-3,3])
figure()
plot(zarr1,zarr2,'-b');hold on;
plot(zarr1(1),zarr2(1),'o',zarr1(i+1),zarr2(i+1),'x');axis([-3,3,-3,3])