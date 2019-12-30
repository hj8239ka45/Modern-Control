clc;clear;
n=1+0+5+3+0+3+0+6+1;
a = fix(n/10);
b = rem(n,10);
%% HW2 - 1 --------  start  --------
% A = [0, 1;-a, b]
% B= [ 0 1];
% s = conv([1 2*a-(a+b)*i],[1 2*a+(a+b)*i])
% k1 = s(3)+A(2,1);
% k2 = s(2)+A(2,2);
% K = [k1 k2]
% A_BK = A - B'*K
% 
% delt = 0.0008; %資料delta區間
% x1 = [2 2]'
% x1arr1 = [0,0,0,0]'; %x座標位置初始
% x1arr2 = x1arr1; %y座標位置初始
% x1arr1(1) = x1(1);
% x1arr2(1) = x1(2);
% x2 = [-2 -2]'
% x2arr1 = [0,0,0,0]'; %x座標位置初始
% x2arr2 = x1arr1; %y座標位置初始
% x2arr1(1) = x2(1);
% x2arr2(1) = x2(2);
% for i=1:10000
%     xN1 = myFindNextPos2(A_BK,x1,delt);
%     xN2 = myFindNextPos2(A_BK,x2,delt);
%     x1arr1(i+1) = xN1(1);
%     x1arr2(i+1) = xN1(2);
%     x2arr1(i+1) = xN2(1);
%     x2arr2(i+1) = xN2(2);
%     x1 = xN1;
%     x2 = xN2;
% end
% figure(1);
% plot(x1arr1,x1arr2,'b',x2arr1,x2arr2,'r');
% hold on; %疊圖
%% HW2 - 1 --------  end  ---------
%% HW2 - 2 --------  start  --------
% A = [1 -2*a b];
% B = [1 -4];
% G = tf(B,A);
% s = conv(conv([1 a+1],[1 a+2]),[1 a+3]);
% %整理後tmp = [a0 b0 b1]
% tmp = ([1 1 0;-2 -4 1;9 0 -4]\[s(2)+2;s(3)-9;s(4)])
% S = [tmp(2) tmp(3)];
% R = [1 tmp(1)];
% C = tf(S,R)
% num = conv(B,S)
% den = conv(A,R)+conv([0 1],conv(B,S))
% sys = tf(num,den)
% rlocus(sys)
% [A,B,C,D] = tf2ss(num,den)
% 
% delt = 0.0008; %資料delta區間
% x1 = [2 2 2]'
% x1arr1 = [0,0,0,0]'; %x座標位置初始
% x1arr2 = x1arr1; %y座標位置初始
% x1arr3 = x1arr1; %z座標位置初始
% x1arr1(1) = x1(1);
% x1arr2(1) = x1(2);
% x1arr3(1) = x1(3);
% x2 = [-2 -2 -2]'
% x2arr1 = [0,0,0,0]'; %x座標位置初始
% x2arr2 = x2arr1; %y座標位置初始
% x2arr3 = x2arr1; %z座標位置初始
% x2arr1(1) = x2(1);
% x2arr2(1) = x2(2);
% x2arr3(1) = x2(3);
% for i=1:5000
%     xN1 = myFindNextPos2(A,x1,delt);
%     xN2 = myFindNextPos2(A,x2,delt);
%     x1arr1(i+1) = xN1(1);
%     x1arr2(i+1) = xN1(2);
%     x1arr3(i+1) = xN1(3);
%     x2arr1(i+1) = xN2(1);
%     x2arr2(i+1) = xN2(2);
%     x2arr3(i+1) = xN2(3);
%     x1 = xN1;
%     x2 = xN2;
% end
% figure(1);
% plot3(x1arr1,x1arr2,x1arr3,'b',x2arr1,x2arr2,x2arr3,'r');
% hold on; %疊圖
%% HW2 - 2 --------  end  ---------
%% HW2 - 3 --------  start  --------
A = [0, 1;-a, b];
B= [ 0 1]';
Q = eye(2);
R = 1;
syms p11 p12 p22;
P = [p11 p12;p12 p22];
A_t = A'
B_t = B'
eq = A_t*P + P*A - P*B*R*B_t*P + Q;
[p11,p12,p22] = solve(eq);
for i = 1:4
    P = double([p11(i) p12(i);p12(i) p22(i)]);
    K = inv(R).*(B_t*P);
end
[K1,P1] = lqr(A,B,Q,R,0);
x1 = 10*[rand(1) rand(1)]';
x2 = x1;
x3 = x1;
delt = 0.008;
%optimal solution控制
J_init1 = x1'*P1*x1;
%P2控制隨意帶入
P2 = [10,9;9,18];
K2 = inv(R)*B'*P2;
J_init2 = x2'*P2*x2;
%P3控制隨意帶入
P3 = [25,5;5,10];
K3 = inv(R)*B'*P3;
J_init3 = x3'*P3*x3;

A_BK = A-B*K1;
A_BK2 = A-B*K2;
A_BK3 = A-B*K3;
J1(1) = 0;
J2(1) = 0;
J3(1) = 0;
t(1) = 0;
for i=1:500
    t(i+1) = i;
    xN1 = myFindNextPos2(A_BK,x1,delt);
    xN2 = myFindNextPos2(A_BK2,x2,delt);
    xN3 = myFindNextPos2(A_BK3,x3,delt);
    x1 = xN1;
    x2 = xN2;
    x3 = xN3;
    %最佳化
    %J1(i) = J_init1 - x1'*P1*x1
    J1(i+1) = x1'*(Q+K1'*R*K1)*x1*delt + J1(i);
    %隨意設
    %J2(i) = J_init2 - x2'*P2*x2
    J2(i+1) = x2'*(Q+K2'*R*K2)*x2*delt + J2(i);
    %J3(i) = J_init3 - x3'*P3*x3
    J3(i+1) = x3'*(Q+K3'*R*K3)*x3*delt + J3(i);
end

figure(1);
plot(t,J1,'b',t,J2,'r',t,J3,'g');
legend('optimal solution','K2 = [9 18]','K3 = [5 18]')
hold on; %疊圖
%% HW2 - 3 --------  end  --------