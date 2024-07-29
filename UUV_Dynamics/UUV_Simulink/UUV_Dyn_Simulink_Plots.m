%% Plots for UUV_Kinematics
clear all; close all; clc;

UUV_Dyn_simulink;

Ma = [323.1   0      0       0       0       0
       0    1049.1   0       0       0    -996.04
       0      0    7040.36   0    -277.20    0
       0      0      0     645.85    0       0
       0      0    -277.20   0    7045.28    0
       0   -996.04   0       0       0    8584.25];

Mrb = [1462    0      0       0       0       0
        0    1462     0       0       0    -32.16
        0      0    1462      0      32.16    0
        0      0      0     498.63    0       0
        0      0    32.16     0    1850.34    0
        0   -32.16    0       0       0    2348.97];

M = Mrb + Ma;
M_inv = inv(M);


t_span = linspace(0,50,500);
eta_0 = [0; 0; 0; 0; 0; 0];
V0 = [0; 0; 0; 0; 0; 0];
sim("UUV_Dyn_simulink",t_span);

load("eta_from_SL_Dyn_model.mat");
load("etaDot_from_SL_Dyn_model.mat");
load("v_from_SL_Dyn_model.mat");

eta = eta(2:7,:);
etaDot = etaDot(2:7,:);
v = v(2:7,:);
%% Position vs time
% 
figure(2);
tiledlayout(3,2)

nexttile
plot(t_span,etaDot(1,:));
xlabel("time(sec)");
ylabel("x_dot");
title("X_dot vs t");
grid on;

nexttile
plot(t_span,etaDot(2,:));
xlabel("time(sec)");
ylabel("Y_dot ");
title("Y_dot vs t");
grid on;

nexttile
plot(t_span,etaDot(3,:));
xlabel("time(sec)");
ylabel("Z_dot");
title("Z_dot vs t");
grid on;

nexttile
plot(t_span,etaDot(4,:));
xlabel("time(sec)");
ylabel("phi_dot");
title("phi_dot vs t");
grid on;

nexttile
plot(t_span,etaDot(5,:));
xlabel("time(sec)");
ylabel("theta_dot(rad/s)");
title("theta_dot vs t");
grid on;

nexttile
plot(t_span,etaDot(6,:));
xlabel("time(sec)");
ylabel("psi_dot(rad/s)");
title("psi_dot vs t");
grid on;

%% V vs time in Ground frame
% 
figure(3);
tiledlayout(3,2)

nexttile
plot(t_span,eta(1,:));
xlabel("time(sec)");
ylabel("X-Pos");
title("X vs t");
grid on;

nexttile
plot(t_span,eta(2,:));
xlabel("time(sec)");
ylabel("Y-Pos ");
title("Y vs t");
grid on;

nexttile
plot(t_span,eta(3,:));
xlabel("time(sec)");
ylabel("Z-Pos");
title("Z vs t");
grid on;

nexttile
plot(t_span,eta(4,:));
xlabel("time(sec)");
ylabel("phi(rad)");
title("phi vs t");
grid on;

nexttile
plot(t_span,eta(5,:));
xlabel("time(sec)");
ylabel("theta(rad)");
title("theta vs t");
grid on;

nexttile
plot(t_span,eta(6,:));
xlabel("time(sec)");
ylabel("psi(rad)");
title("psi vs t");
grid on;

%% V vs time in bodyframe
% 
figure(4);
tiledlayout(3,2)

nexttile
plot(t_span,v(1,:));
xlabel("time(sec)");
ylabel("Vxb");
title("Vxb vs t");
grid on;

nexttile
plot(t_span,v(2,:));
xlabel("time(sec)");
ylabel("Vyb ");
title("Vyb vs t");
grid on;

nexttile
plot(t_span,v(3,:));
xlabel("time(sec)");
ylabel("Vzb");
title("Vzb vs t");
grid on;

nexttile
plot(t_span,v(4,:));
xlabel("time(sec)");
ylabel("Wxb");
title("Wxb vs t");
grid on;

nexttile
plot(t_span,v(5,:));
xlabel("time(sec)");
ylabel("Wyb");
title("Wyb vs t");
grid on;

nexttile
plot(t_span,v(6,:));
xlabel("time(sec)");
ylabel("Wzb");
title("Wzb vs t");
grid on;