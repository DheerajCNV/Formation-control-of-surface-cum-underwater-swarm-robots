% clc; clear all; close all;
% 
% %% Parameters
% param.g = 9.80665;   
% param.m = 2;
% l_mat = linspace(0.5,2,15);
% 
% %% initial state variables
% % S = [theta; theta_dot];
% % S_dot = [theta_dot, theta_ddot];
% 
% S0 = [-pi/4; 0];
% 
% %%
% 
% tspan = linspace(0, 20, 600);
% x_b = zeros(15,length(tspan));
% y_b = zeros(15,length(tspan));
% 
% options = odeset('reltol',1e-9,'abstol',1e-9);
% 
% for j = 1:15
%     
%     [t_out, S_out] = ode45(@(t,S)sp_ODE(t,S,l_mat(j),param), tspan, S0, options);
%     
%     %% x_t and y_t
%     for i = 1:length(t_out)
%     
%         q = S_out(i,1);
%     
%         H1_0 = [cos(q), -sin(q), 0;
%                 sin(q),  cos(q), 0;
%                      0,       0, 1];
%         
%         P_b = H1_0*[l_mat(j);0;1];
%     
%         x_b(j,i) = P_b(1);
%         y_b(j,i) = P_b(2);
%     
%     end
% end
% 
% %% Animation and Plots
% 
% SP_Animation;
% Plots;
% 
% %% ODE
% 
% function Sdot = sp_ODE(t,S,l,param)
% 
% Sdot = zeros(2,1);
% 
% Sdot(1) = S(2);
% Sdot(2) = -(param.g/l)*sin(S(1) - 3*pi/2);
% 
% end

%

clc; clear all; close all;

%% Parameters
param.g = 9.80665;   
param.m = 2;
f = linspace(6,3,15);
l_mat = zeros(1,15);

for i = 1:15
    l_mat(1,i) = (param.g)/(2*pi*f(i))^2;
end

%% initial state variables
% S = [theta; theta_dot];
% S_dot = [theta_dot, theta_ddot];

S0 = [-pi/4; 0];

%%

tspan = linspace(0, 5, 1500);
x_b = zeros(15,length(tspan));
y_b = zeros(15,length(tspan));

options = odeset('reltol',1e-9,'abstol',1e-9);

for j = 1:15
    
    [t_out, S_out] = ode45(@(t,S)sp_ODE(t,S,l_mat(j),param), tspan, S0, options);
    
    %% x_t and y_t
    for i = 1:length(t_out)
    
        q = S_out(i,1);
    
        H1_0 = [cos(q), -sin(q), 0;
                sin(q),  cos(q), 0;
                     0,       0, 1];
        
        P_b = H1_0*[l_mat(j);0;1];
    
        x_b(j,i) = P_b(1);
        y_b(j,i) = P_b(2);
    
    end
end

%% Animation and Plots

SP_Animation;
Plots;

%% ODE

function Sdot = sp_ODE(t,S,l,param)

Sdot = zeros(2,1);

Sdot(1) = S(2);
Sdot(2) = -(param.g/l)*sin(S(1) - 3*pi/2);

end


    