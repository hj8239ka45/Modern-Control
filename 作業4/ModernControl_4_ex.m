% clc;clear;close all;
delt=0.0001;
totTime = 10 ;
totalStep = totTime/delt ;
tarr= [0 : 1 : totalStep]*delt;
uarr = tarr*0; % 0 array
yarr= uarr; % 0 array
x1arr=uarr; x2arr=uarr;
z1arr=uarr; z2arr=uarr;
x1prev = 2;
x2prev = -1;
x1arr(1) = x1prev ; % time = 0;
x2arr(1) = x2prev ;
z1prev = x1prev ;
z2prev = x2prev + x2prev*x2prev*x2prev ;
z1arr(1) = z1prev ;
z2arr(1) = z2prev ;
for i = 1 : totalStep
    tmp1 = 1 + 3*x2prev*x2prev ;
    u = (-5*z1prev - 2*z2prev)/tmp1;
    x1cur = x1prev + (x2prev + x2prev*x2prev*x2prev)*delt ;
    x2cur = x2prev + u*delt;
    z1cur = x1prev ;
    z2cur = x2cur + x2cur*x2cur*x2cur ;
    x1arr(i+1) = x1cur ;
    x2arr(i+1) = x2cur ;
    z1arr(i+1) = z1cur ;
    z2arr(i+1) = z2cur ;
    uarr(i+1) = u ;
    yarr(i+1) = x1cur;
    x1prev = x1cur;
    x2prev = x2cur;
    z1prev = z1cur;
    z2prev = z2cur;
    y1(i+1) = x1cur;
    y2(i+1) = z1cur;
end
figure(); plot(tarr,y1,'r',tarr,y2,'b')
figure(); plot(tarr,x1arr,'r',tarr,x2arr,'b');
figure(); plot(tarr,z1arr,'r',tarr,z2arr,'b');
figure(); plot(x1arr, x2arr,'r');axis([-3,3,-3,3])
figure(); plot(z1arr, z2arr,'b');axis([-3,3,-3,3])
figure(); plot(tarr, yarr,'b');