clc;clear;
%% main code.
[u, y] = textread('hw6Data.txt', '%f%f');
len = length(u);
plot(u,y,'o');
xlabel("u(data1)")
ylabel("y(data2)")
tmp = 0;
tmp2 = 0;
for i=4:len
    phi = zeros(4,1);
    phi(1) = y(i-1);
    phi(2) = y(i-2);
    phi(3) = u(i-1);
    phi(4) = u(i-2);
    tmp = tmp + phi*phi';
    tmp2 = tmp2 + y(i)*phi;
    theta(i-3,:) = inv(tmp)*tmp2;
end
tmp3 = inv(tmp);
%[-a1 -a2 b1 b2]
theta(len-2,:) = tmp3*tmp2;
% M = sum(y-)

tt = 1:len-2;
plot(tt,theta(:,1),tt,theta(:,2),tt,theta(:,3),tt,theta(:,4));