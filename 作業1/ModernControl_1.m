clc;clear;close all;
an = 24 %���ζ�P��
for i=1:an %�إ߶�P�y��(�b�|��4)
    xp(i,1) = 2*cos(pi*i*2/an);
    xp(i,2) = 2*sin(pi*i*2/an);
end
for i=1:an %�H��P�y�Ф��O�]��
    x = [xp(i,1) xp(i,2)]'
    x1arr = [0,0,0,0]'; %x�y�Ц�m��l
    x2arr = x1arr; %y�y�Ц�m��l
    tarr = x1arr;  
    delt = 0.0002; %���delta�϶�
    x1arr(1) = x(1);
    x2arr(1) = x(2);
    for i=1:2000
    %for i=1:2000
        xN = myFindNextPos1(x,delt);
        x1arr(i+1) = xN(1);
        x2arr(i+1) = xN(2);
        tarr(i)  = delt*i; %�ɶ����
        x = xN;
    end
    figure(1);
    plot(x1arr,x2arr,'b');
    hold on; %�|��
end