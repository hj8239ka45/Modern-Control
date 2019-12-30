clc;clear;
%% final
t = 0.01:0.01:10;

G_num = [0.5 3];
G_den = [1 2 0];
G_sys = tf(G_num,G_den);

C_num = [20 1];
C_den = [1 1];
C_sys = tf(C_num,C_den);

g_num = [1 1];
g_den = [20 1];
g_sys = tf(g_num,g_den);

de_num = [-0.065 1];
de_den = [0.065 1];
de_sys = tf(de_num,de_den);

d = 0.1*( tf([cos(2.7)*10],[1 0 100])   + tf([sin(2.7)*1 0],[1 0 100]));
R = tf([1],[1 0]);
%step((G_sys-g_sys*de_sys)*d*(C_sys*G_sys))
bode(((1-C_sys*g_sys*de_sys)*d)/(1+(G_sys-g_sys*de_sys)*C_sys))

%bode(C_sys*G_sys)
% fb_sys = (C_sys*G_sys + (1-C_sys*g_sys*de_sys)*d/R) / (1+(G_sys-g_sys*de_sys)*C_sys);
% step(fb_sys,10);
