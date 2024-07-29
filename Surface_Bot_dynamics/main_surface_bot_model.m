clear all; close all; clc;
clf;

Surface_model_Simulink;

t_span = linspace(0,10,500);
S0 = [0; 0];

m = 1462;
Izz = 2348.97;
d = 1;

sim("Surface_model_Simulink",t_span)

load("var.mat");

xlow  = min(tot(2,:)) - 1;
xhigh = max(tot(2,:)) + 1;
ylow  = min(tot(3,:)) - 1;
yhigh = max(tot(3,:)) + 1;

f = size(tot);

for j = 1:f(2)
    clf;
    P_cm  = (tot(2:4,j))';

    xc = P_cm(1);
    yc = P_cm(2);
    theta = P_cm(3);

    A0 = [-1; -0.5];
    B0 = [-1; 0.5];
    C0 = [1; 1];
    D0 = [2; 0];
    E0 = [1; -1];
    cm = [xc;yc];

    C_t = [cos(theta) sin(theta); -sin(theta) cos(theta)];

    At = C_t*A0 + cm;
    Bt = C_t*B0 + cm;
    Ct = C_t*C0 + cm;
    Dt = C_t*D0 + cm;
    Et = C_t*E0 + cm;

    XB = [At(1) Bt(1) Ct(1) Dt(1) Et(1)] ;
    YB = [At(2) Bt(2) Ct(2) Dt(2) Et(2)] ;

    hold on
    fill(XB,YB,'b');
    plot(xc,yc,'go');
    axis equal;
    xlim([xlow-2 xhigh+2]);
    ylim ([ylow-2 yhigh+2]);

    drawnow
end

