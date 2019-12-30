clc;clear;
a=2;b=2;
A = [0 1;-a b];
b = [0;1];
k = [30 9];
u = -k;
B = b*u ;
%% ???@?D
step = 50000;
x1=zeros(step,1); x2=zeros(step,1);
x1(1)=-10; x2(1)=5;
figure(1)
x1array=[-10,5,5,-2];
for p=1:2
    x1(1)=x1array(2*p-1); x2(1)=x1array(2*p);
    for i=1:step
        x1_dot(i)=A(1,1)*x1(i)+A(1,2)*x2(i)+B(1,1)*x1(i)+B(1,2)*x2(i);
        x2_dot(i)=A(2,1)*x1(i)+A(2,2)*x2(i)+B(2,1)*x1(i)+B(2,2)*x2(i);
        x1(i+1)=x1(i)+x1_dot(i)*0.001;
        x2(i+1)=x2(i)+x2_dot(i)*0.001;
    end
    plot(x1(1),x2(1),'x',x1,x2)
    hold on
end
legend('(-10,5)','','(5,-2)','')
hold off
%% ???G?D
numG=[0 1 -4];
denG=[1 -4 2];
numC=[-232 109];
denC=[1 248];
num=conv(numG,numC);
den=conv(denG,denC);
GC=tf(num,num+den);
[A2, B2, C2, D2]=tf2ss(num,num+den);
x21=zeros(step,1);x22=zeros(step,1);x23=zeros(step,1);
x2array=[5,50,9,1,15,-17];
figure(2);
for r=1:2
    x21(1)=x2array(3*r-2);x22(1)=x2array(3*r-1);x23(1)=x2array(3*r);
    for i=1:step
        x21_dot(i)=A2(1,1)*x21(i)+A2(1,2)*x22(i)+A2(1,3)*x23(i);
        x22_dot(i)=A2(2,1)*x21(i)+A2(2,2)*x22(i)+A2(2,3)*x23(i);
        x23_dot(i)=A2(3,1)*x21(i)+A2(3,2)*x22(i)+A2(3,3)*x23(i);
        x21(i+1)=x21(i)+x21_dot(i)*0.0001;
        x22(i+1)=x22(i)+x22_dot(i)*0.0001;
        x23(i+1)=x23(i)+x23_dot(i)*0.0001;
    end
    plot3(x21(1),x22(1),x23(1),'x',x21,x22,x23)
    hold on
end
grid on
legend('(5,5,9)','','(1,5,7)','')
%% ???T?D
clc;clear;
a=2;b=2;
A = [0 1;-a b];
b = [0;1];
Q = [1 0;0 1];
R = 1;
[K,P]=lqr(A,b,Q,R,0);
x31(1)=2;
x32(1)=9;
Parray=[P;9 3;3 2;4 6;6 0];
B31=-b*K;
B32=-b*[3 4];
B33=-b*[6 6];
B=[B31;B32;B33];
step3=5000;
figure(3);
X0=[x31(1);x32(1)];

for l=1:3
    for i=1:step3
        x31_dot(i)=A(1,1)*x31(i)+A(1,2)*x32(i)+B(2*l-1,1)*x31(i)+B(2*l-1,2)*x32(i);
        x32_dot(i)=A(2,1)*x31(i)+A(2,2)*x32(i)+B(2*l,1)*x31(i)+B(2*l,2)*x32(i);
        x31(i+1)=x31(i)+x31_dot(i)*0.001;
        x32(i+1)=x32(i)+x32_dot(i)*0.001;
        Xf=[x31(i);x32(i)];
        ji(l) = (X0)'*Parray((2*l-1):(2*l),1:2)*(X0);
        jf(l) = (Xf)'*Parray((2*l-1):(2*l),1:2)*(Xf);
        J(l,i)=ji(l)-jf(l);
    end
end
hold on
plot(J(1,1:step3))
plot(J(2,1:step3))
plot(J(3,1:step3))
legend('optimal solution','J2','J3')