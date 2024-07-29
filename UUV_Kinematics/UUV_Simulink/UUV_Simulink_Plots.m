%% Plots for UUV_Kinematics
clear all; close all; clc;

UUV_simulink
t_span = linspace(0,10,500);
S0 = [0; 0; 0; 0; 0; 0];
sim("UUV_simulink",t_span);

load("data_from_SL_model.mat");

eta = eta(2:7,:);
%% X-Position vs time; Vx vs time in Ground frame.
% 
tiledlayout(3,2)

nexttile
plot(t_span,eta(1,:));
xlabel("time(sec)");
ylabel("X-Pos vs time");
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