clc; clear all; close all;

%% Parameters
param.g = 9.80665;   
param.m = 2;
param.l = 1.5;
param.k = 0.2;

%% initial state variables
% S = [theta; theta_dot];
% S_dot = [theta_dot, theta_ddot];

S0 = [pi/4; 2];

%%

tspan = linspace(0,10,600);

options = odeset('reltol',1e-9,'abstol',1e-9);

[t_out, S_out] = ode45(@(t,S)sp_ODE(t,S,param), tspan, S0, options);

%% x_t and y_t 

x_b = zeros(length(t_out));
y_b = zeros(length(t_out));

for i = 1:length(t_out)

    q = S_out(i,1);

    H1_0 = [cos(q), -sin(q), 0;
            sin(q),  cos(q), 0;
                 0,       0, 1];
    
    P_b = H1_0*[param.l;0;1];

    x_b(i) = P_b(1);
    y_b(i) = P_b(2);

end

%% Animation and Plots

SP_wD_Animation;
Plots;

%% ODE

function Sdot = sp_ODE(t,S,param)

Sdot = zeros(2,1);

Sdot(1) = S(2);
Sdot(2) = -(param.g/param.l)*sin(S(1) - 3*pi/2) - param.k*S(2);

end



    