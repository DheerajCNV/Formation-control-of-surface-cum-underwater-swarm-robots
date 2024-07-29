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

f = size(eta);

tot = eta;

xlow = min(tot(2,:)) - 1;
xhigh = max(tot(2,:)) + 1;
ylow = min(tot(3,:)) - 1;
yhigh = max(tot(3,:)) + 1;
zlow = min(-tot(4,:)) - 1;
zhigh = max(-tot(4,:)) + 1;

s = abs(xhigh - xlow)/15;


for j = 1:f(2)

clf;
    plot3(tot(2,:),tot(3,:),-tot(4,:),"r");
    P_cm  = (tot(2:4,j));

    xc = P_cm(1);
    yc = P_cm(2);
    zc = -P_cm(3);
    P_cm(3) = - P_cm(3);

    phi = tot(5,j);
    theta = tot(6,j);
    psi = tot(7,j);

    A0 = [-1; -0.5; 0]*s;
    B0 = [-1; 0.5; 0]*s;
    C0 = [1; 1; 0]*s;
    D0 = [2; 0; 0]*s;
    E0 = [1; -1; 0]*s;
    F0 = [1; 0; -1]*s;
    G0 = [0; 0; -1]*s;

    C_psi = [cos(psi) -sin(psi) 0; -sin(psi) cos(psi) 0; 0 0 1];
    C_theta = [cos(theta) 0 -sin(theta); 0 1 0; sin(theta) 0 cos(theta)];
    C_phi = [1 0 0; 0 cos(phi) -sin(phi); 0 sin(phi) cos(phi)];

    C_t = (C_psi*C_phi*C_theta)';

    At = C_t*A0 + P_cm;
    Bt = C_t*B0 + P_cm;
    Ct = C_t*C0 + P_cm;
    Dt = C_t*D0 + P_cm;
    Et = C_t*E0 + P_cm;
    Ft = C_t*F0 + P_cm;
    Gt = C_t*G0 + P_cm;
    
    %For Pentagon ABCDE
    XB = [At(1) Bt(1) Ct(1) Dt(1) Et(1)] ;
    YB = [At(2) Bt(2) Ct(2) Dt(2) Et(2)] ;
    ZB = [At(3) Bt(3) Ct(3) Dt(3) Et(3)] ;

    %For Triangle CDF
    Xt1 = [Ct(1) Dt(1) Ft(1)] ;
    Yt1 = [Ct(2) Dt(2) Ft(2)] ;
    Zt1 = [Ct(3) Dt(3) Ft(3)] ;

    %For Triangle DEF
    Xt2 = [Et(1) Dt(1) Ft(1)] ;
    Yt2 = [Et(2) Dt(2) Ft(2)] ;
    Zt2 = [Et(3) Dt(3) Ft(3)] ;

    %For Triangle ABG
    Xt3 = [At(1) Bt(1) Gt(1)] ;
    Yt3 = [At(2) Bt(2) Gt(2)] ;
    Zt3 = [At(3) Bt(3) Gt(3)] ;

    %For Rectangle BCFG
    Xr1 = [Bt(1) Ct(1) Ft(1) Gt(1)] ;
    Yr1 = [Bt(2) Ct(2) Ft(2) Gt(2)] ;
    Zr1 = [Bt(3) Ct(3) Ft(3) Gt(3)] ;

    %For Rectangle AEFG
    Xr2 = [At(1) Et(1) Ft(1) Gt(1)] ;
    Yr2 = [At(2) Et(2) Ft(2) Gt(2)] ;
    Zr2 = [At(3) Et(3) Ft(3) Gt(3)] ;


    hold on
    patch([-2 -2 12 12],[-2 12 12 -2],[0 0 0 0],[0.5,0.5,0.7],'FaceAlpha',.3)
    patch(XB,YB,ZB,[0.5 0.5 1]); % For Pentagon ABCDE
    patch(Xt1,Yt1,Zt1,[0.3 0.3 1]); % For Triangle CDF
    patch(Xt2,Yt2,Zt2,[0.3 0.3 1]); % For Triangle DEF
    patch(Xt3,Yt3,Zt3,[0.3 0.3 1]); % For Triangle ABG
    patch(Xr1,Yr1,Zr1,[0.3 0.3 1]); % For Rectangle BCFG
    patch(Xr2,Yr2,Zr2,[0.3 0.3 1]); % For Rectangle AEFG
    plot3(xc,yc,zc,'yo'); % For P_cm

%     axis equal;
    view([45 45 45]);
    grid on;
    xlabel("x");
    ylabel("y");
    zlabel("z");
    str = sprintf('v');
    title(str);
    xlim([xlow,xhigh]);
    ylim([ylow,yhigh]);
    zlim([zlow,zhigh]);

    drawnow
end

