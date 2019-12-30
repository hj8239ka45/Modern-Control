clc;clear;
%% final
x = [5 5 5]';
totalStep = 5000;
x1arr = zeros(totalStep,1); %x座標位置初始
x2arr = x1arr; %y座標位置初始
x3arr = x1arr;
tarr = x1arr; 
delt = 0.005; %資料delta區間
x1arr(1) = x(1);
x2arr(1) = x(2);
x3arr(1) = x(3);
syms s;
a1=-80;
a2=-66;
a3=-15;
A = [0 1 0;
     0 0 1;
     a1 a2 a3];
s=double(solve(s^3-a3*s^2-a2*s-a1))

for i=1:totalStep
    x_dot = zeros(size(x));
    xN = x_dot;
    x_dot = A*x;
    xN = x + x_dot*delt;
    
    x1arr(i+1) = xN(1);
    x2arr(i+1) = xN(2);
    x3arr(i+1) = xN(3);
    tarr(i+1)  = delt*i; %時間資料
    x = xN;
end
figure(1);
plot3(x1arr,x2arr,x3arr,'b');
xlabel('x1');ylabel('x2');zlabel('x3')
figure(2);
plot(tarr,x1arr,'r',tarr,x2arr,'g',tarr,x3arr,'b');
xlabel('Time');ylabel('X');
legend('x1','x2','x3')
