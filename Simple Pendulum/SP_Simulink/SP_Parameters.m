clear all; close all; clc;

g = 9.80665;
l = 1.5;
k = 0.2;
m = 2;
t_span = linspace(0,10,300);
S0 = [pi/4 ,2];

% x_b = zeros(length(t_out));
% y_b = zeros(length(t_out));
% 
% for i = 1:length(t_out)
% 
%     q = S_out(i,1);
% 
%     H1_0 = [cos(q), -sin(q), 0;
%             sin(q),  cos(q), 0;
%                  0,       0, 1];
%     
%     P_b = H1_0*[param.l;0;1];
% 
%     x_b(i) = P_b(1);
%     y_b(i) = P_b(2);
% 
% end

%sim("SP_Simulink.slx",t_span);

sim("SP_sim_using_MATLAB_Function.slx",t_span);


