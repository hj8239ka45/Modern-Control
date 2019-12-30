clc;clear;
%% main code
%Set M0 = 2
m0 = 2;
delt = 0.01;
totTime = 10;
totalStep = totTime/delt ;
tarr= [0 : 1 : totalStep]*delt;

%% off line
uarr = sin(tarr)+sin(2*tarr)+sin(3*tarr);
nTot = length(uarr);
darr = 0.1*rand(1,nTot);
yarr = uarr/m0 + darr;

UY_integral = zeros(1,totalStep+1);
YY_integral = zeros(1,totalStep+1);
for i = 2:totalStep+1
    UY_integral(i) = UY_integral(i-1) + uarr(i)*yarr(i)*delt;
    YY_integral(i) = YY_integral(i-1) + yarr(i)*yarr(i)*delt;
    m1(i) = UY_integral(i)/YY_integral(i);
end

%% on line
uarr = sin(tarr)+sin(2*tarr)+sin(3*tarr);
nTot = length(uarr);
yarr = uarr/m0 + darr;
YY_integral = zeros(1,totalStep+1);
m2 = zeros(1,totalStep+1);
m2(1) = 0;
for i = 2:totalStep+1
    YY_integral(i) = YY_integral(i-1) + yarr(i)*yarr(i)*delt;
    error = -(uarr(i)-m2(i-1)*yarr(i));
    m_dot = -error*yarr(i)/YY_integral(i);
    m2(i) = m2(i-1) + m_dot*delt;
end
figure(1);
plot(tarr,m1,'r');
hold on;
plot(tarr,m2,'b');
hold on;
plot(tarr,m2-m1);
title("Adaptive");
xlabel('Time');ylabel('Mhat');
legend("In Time","On Time");
m1(totalStep+1)
m2(totalStep+1)
m1-m2