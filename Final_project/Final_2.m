clc;clear;close all;
%% final
% x = [2 -6 -5]';
% totalStep = 5000;
% x1arr = zeros(totalStep,1); %x座標位置初始
% x2arr = x1arr; %y座標位置初始
% x3arr = x1arr;
% tarr = x1arr; 
% delt = 0.005; %資料delta區間
% x1arr(1) = x(1);
% x2arr(1) = x(2);
% x3arr(1) = x(3);
% a=1;b=8;c=10;
% S(1) = a*x(1)+b*x(2)+c*x(3);
% for i=1:totalStep
%     S(i+1) = a*x(1)+b*x(2)+c*x(3);
%     k = 20*S(i+1);
%     u =  -1*( a*(x(2)+x(1)-x(3)+sin(x(1)-x(3))) + b*(x(3)+(x(1)-x(3))^2) + c*(sin(x(1)-x(3))) )-1*k;
%     A = [1 1 -1;
%          x(1)-2*x(3) 0 1+x(3);
%          0 0 0];
%     x_dot = zeros(size(x));
%     xN = x_dot;
%     B_sin = [1;0;1];
%     B_u = [0;0;1];
%     x_dot = A*x + B_sin*sin(x(1)-x(3)) + B_u*u;
%     
%     xN = x + x_dot*delt;
%     
%     x1arr(i+1) = xN(1);
%     x2arr(i+1) = xN(2);
%     x3arr(i+1) = xN(3);
%     tarr(i+1)  = delt*i; %時間資料
%     x = xN;
% end
% figure(1);
% plot3(x1arr,x2arr,x3arr,'b');
% xlabel('x1');ylabel('x2');zlabel('x3');hold on;
% plot3(x1arr(1),x2arr(1),x3arr(1),'o',x1arr(totalStep+1),x2arr(totalStep+1),x3arr(totalStep+1),'x')
% figure(2);
% plot(tarr,x1arr,'r',tarr,x2arr,'g',tarr,x3arr,'b',tarr,S,'y');%
% %plot(tarr(1:30),x1arr(1:30),'r',tarr(1:30),x2arr(1:30),'g',tarr(1:30),x3arr(1:30),'b');
% xlabel('Time');ylabel('X');
% legend('x1','x2','x3','S')

%%
x = [8 -6 -5]';
totalStep = 5000;
x1arr = zeros(totalStep,1); %x座標位置初始
x2arr = x1arr; %y座標位置初始
x3arr = x1arr;
tarr = x1arr; 
delt = 0.005; %資料delta區間
x1arr(1) = x(1);
x2arr(1) = x(2);
x3arr(1) = x(3);

zarr1 = zeros(totalStep,1);zarr2 = zarr1;
zarr1(1) = x(1);  zarr2(1) = x(2)+x(1)-x(3)+sin(x(1)-x(3));
z_1=zarr1(1);z_2=zarr1(2);
a=1;b=2;
S(1) = a*z_1+b*z_2;
for i=1:totalStep
%     S(i+1) = a*x(1)+b*x(2)+c*x(3);
%     k = 8*S(i+1);
%     u =  -1*( a*(x(2)+x(1)-x(3)+sin(x(1)-x(3))) + b*(x(3)+(x(1)-x(3))^2) + c*(sin(x(1)-x(3))) )-1*k;
    S(i+1) = a*z_1+ b*z_2;
    k = 4*S(i+1);
    %u_slide = (100*z_1+ 99*z_2- z_2/b)-1*k;
    u_slide = k;
    tmp = (x(1)-x(3))^2+x(2)+x(1)+(x(2)+x(1)-x(3))*cos(x(1)-x(3))+ 100*z_1+99*z_2-u_slide;
    u_fb =  tmp/( cos(x(1)-x(3))+1 );
    u = u_fb;
    A = [1 1 -1;
         x(1)-2*x(3) 0 1+x(3);
         0 0 0];
    x_dot = zeros(size(x));
    xN = x_dot;
    B_sin = [1;0;1];
    B_u = [0;0;1];
    x_dot = A*x + B_sin*sin(x(1)-x(3)) + B_u*u;
    
    xN = x + x_dot*delt;
    
    x1arr(i+1) = xN(1);
    x2arr(i+1) = xN(2);
    x3arr(i+1) = xN(3);
    tarr(i+1)  = delt*i; %時間資料
    x = xN;
    z_1 = x(1); z_2 = x(2)+x(1)-x(3)+sin(x(1)-x(3));
    zarr1(i+1) = z_1;zarr2(i+1) = z_2;
end
figure(1);
plot3(x1arr,x2arr,x3arr,'b');
xlabel('x1');ylabel('x2');zlabel('x3');hold on;
plot3(x1arr(1),x2arr(1),x3arr(1),'o',x1arr(totalStep+1),x2arr(totalStep+1),x3arr(totalStep+1),'x')
figure(2);
plot(tarr,x1arr,'r',tarr,x2arr,'g',tarr,x3arr,'b',tarr,S,'y');%
%plot(tarr(1:30),x1arr(1:30),'r',tarr(1:30),x2arr(1:30),'g',tarr(1:30),x3arr(1:30),'b');
xlabel('Time');ylabel('X');
legend('x1','x2','x3','S')

%
% x = [2 -6 5]';
% totalStep = 5000;
% x1arr = zeros(totalStep,1); %x座標位置初始
% x2arr = x1arr; %y座標位置初始
% x3arr = x1arr;
% tarr = x1arr; 
% delt = 0.005; %資料delta區間
% x1arr(1) = x(1);
% x2arr(1) = x(2);
% x3arr(1) = x(3);
% V(1) = 0.5*(x(1)^2+x(2)^2+x(3)^2);
% for i=1:totalStep
%     num1 = x(1)*(x(2)+x(1)-x(3)+sin(x(1)-x(3)));
%     num2 = x(2)*(x(3)+(x(1)-x(3))^2);
%     u =  -(num1+num2)/x(3) -sin(x(1)-x(3)) -5*(V(i))*x(3);
%     Num1(i) = num1;
%     Num2(i) = num2;
%     V_dot(i) = num1+num2+x(3)*(sin(x(1)-x(3))+u);
%     uarr(i) = u;
%     A = [1 1 -1;
%          x(1)-2*x(3) 0 1+x(3);
%          0 0 0];
%     x_dot = zeros(size(x));
%     xN = x_dot;
%     B_sin = [1;0;1];
%     B_u = [0;0;1];
%     x_dot = A*x + B_sin*sin(x(1)-x(3)) + B_u*u;
%     XX(i) = x_dot(1);
%     
%     xN = x + x_dot*delt;
%     
%     x1arr(i+1) = xN(1);
%     x2arr(i+1) = xN(2);
%     x3arr(i+1) = xN(3);
%     tarr(i+1)  = delt*i; %時間資料
%     x = xN;
%     V(i+1) = 0.5*(x(1)^2+x(2)^2+x(3)^2);
% end
% figure(1);
% plot3(x1arr,x2arr,x3arr,'b');
% xlabel('x1');ylabel('x2');zlabel('x3');hold on;
% plot3(x1arr(1),x2arr(1),x3arr(1),'o',x1arr(totalStep+1),x2arr(totalStep+1),x3arr(totalStep+1),'x')
% figure(2);
% plot(tarr,x1arr,'r',tarr,x2arr,'g',tarr,x3arr,'b');%,tarr,S,'y'
% %plot(tarr(1:30),x1arr(1:30),'r',tarr(1:30),x2arr(1:30),'g',tarr(1:30),x3arr(1:30),'b');
% xlabel('Time');ylabel('X');
% legend('x1','x2','x3')%,'S'

