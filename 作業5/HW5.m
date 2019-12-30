%% Student ID
n=1+0+5+3+0+3+0+6+1;
a = fix(n/10);
b = rem(n,10);
%k = 1
delt = 0.0001;
totTime = 15 ;
totalStep = totTime/delt ;
tarr= [0 : 1 : totalStep]*delt;
for k=1:4
    x = [2 6]'
    xarr1 = [0,0,0,0]';xarr2 = xarr1;
    xarr1(1) = x(1);  xarr2(1) = x(2);
    x_1 = xarr1(1); x_2 = xarr2(1);
    for i=1:totalStep
        Bx = [0;(x_1^2+x_2^2)];
        Ax = [ 0  1; 
              b*x_2^3 a*x_1^3
            ];
        A = 1;
        B = 1;
        s = A*x_2+B*x_1;
        if s>0
            %k = s; %解開註解做k=s控制，註解為k=k*sign(s)
            ux = -1*((A*(a*x_1^3*x_2 + b*x_1*x_2^3) + B*x_2) + k)/(x_1^2+x_2^2);
        else
            %k = -s; %解開註解做k=s控制，註解為k=k*sign(s)
            ux = -1*((A*(a*x_1^3*x_2 + b*x_1*x_2^3) + B*x_2) - k)/(x_1^2+x_2^2);
        end
        xNew = zeros(size(x));
        ut = Bx*ux;
        x_dot = Ax*x+ut;
        xNew = x + x_dot*delt;
        xN = xNew;
        xarr1(i+1) = xN(1);xarr2(i+1) = xN(2);
        x = xN;
        x_1 = xN(1);x_2 = xN(2);
    end
    figure(2)
    plot(xarr1,xarr2,'-');hold on;
    %plot(xarr1(1),xarr2(1),'o',xarr1(i+1),xarr2(i+1),'x');
end
legend('k=1','k=2','k=3','k=4')
plot(xarr1(1),xarr2(1),'o',xarr1(i+1),xarr2(i+1),'x');
xlabel('x1');ylabel('x2');
% figure(1);plot(tarr,xarr1,'-r',tarr,xarr2,'-b');legend('x1','x2');
% ylabel('x');xlabel('Time');
% figure(2)
% plot(xarr1,xarr2,'-b');hold on;
% plot(xarr1(1),xarr2(1),'o',xarr1(i+1),xarr2(i+1),'x');
% ylabel('x1');xlabel('x2');
