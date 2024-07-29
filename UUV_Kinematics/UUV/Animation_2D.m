
clear all; close all; clc;
clf;

UUV_kinematics

f = size(tot);

for j = 1:f(1)
    clf;
    P_cm  = (tot(j,2:3))';

    xc = P_cm(1);
    yc = P_cm(2);

    phi = tot(j,5);
    theta = tot(j,6);
    psi = tot(j,7);  

    A0 = [-1; -0.5];
    B0 = [-1; 0.5];
    C0 = [1; 1];
    D0 = [2; 0];
    E0 = [1; -1];

    C_t = [cos(psi) sin(psi); -sin(psi) cos(psi)];

    At = C_t*A0 + P_cm;
    Bt = C_t*B0 + P_cm;
    Ct = C_t*C0 + P_cm;
    Dt = C_t*D0 + P_cm;
    Et = C_t*E0 + P_cm;

    XB = [At(1) Bt(1) Ct(1) Dt(1) Et(1)] ;
    YB = [At(2) Bt(2) Ct(2) Dt(2) Et(2)] ;

    hold on
    fill(XB,YB,'b');
    plot(xc,yc,'go');
    axis equal;
    xlim([-1 10]);
    ylim ([-1 10]);

    drawnow
end

