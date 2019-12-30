clc;clear;close all;
an = 24 %切割圓周角
for i=1:an %建立圓周座標(半徑為4)
    xp(i,1) = 2*cos(pi*i*2/an);
    xp(i,2) = 2*sin(pi*i*2/an);
end
for i=1:an %以圓周座標分別跑圖
    x = [xp(i,1) xp(i,2)]'
    x1arr = [0,0,0,0]'; %x座標位置初始
    x2arr = x1arr; %y座標位置初始
    tarr = x1arr;  
    delt = 0.0002; %資料delta區間
    x1arr(1) = x(1);
    x2arr(1) = x(2);
    for i=1:2000
    %for i=1:2000
        xN = myFindNextPos1(x,delt);
        x1arr(i+1) = xN(1);
        x2arr(i+1) = xN(2);
        tarr(i)  = delt*i; %時間資料
        x = xN;
    end
    figure(1);
    plot(x1arr,x2arr,'b');
    hold on; %疊圖
end