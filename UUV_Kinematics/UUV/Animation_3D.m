clear all; close all; clc;

UUV_kinematics
f = size(tot);

for j = 1:f(1)
    clf;
    plot3(tot(:,2),tot(:,3),tot(:,4),"r");
    P_cm  = (tot(j,2:4))';

    xc = P_cm(1);
    yc = P_cm(2);
    zc = P_cm(3);

    phi = tot(j,5);
    theta = tot(j,6);
    psi = tot(j,7);  

    A0 = [-1; -0.5; 0];
    B0 = [-1; 0.5; 0];
    C0 = [1; 1; 0];
    D0 = [2; 0; 0];
    E0 = [1; -1; 0];
    F0 = [1; 0; -1];
    G0 = [0; 0; -1];

    C_psi = [cos(psi) -sin(psi) 0; -sin(psi) cos(psi) 0; 0 0 1];
    C_theta = [cos(theta) 0 -sin(theta); 0 1 0; sin(theta) 0 cos(theta)];
    C_phi = [1 0 0; 0 cos(phi) -sin(phi); 0 sin(phi) cos(phi)];

    C_t = (C_phi*C_theta*C_psi)';

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
    patch(XB,YB,ZB,'b'); % For Pentagon ABCDE
    patch(Xt1,Yt1,Zt1,'b'); % For Triangle CDF
    patch(Xt2,Yt2,Zt2,'b'); % For Triangle DEF
    patch(Xt3,Yt3,Zt3,'b'); % For Triangle ABG
    patch(Xr1,Yr1,Zr1,'b'); % For Rectangle BCFG
    patch(Xr2,Yr2,Zr2,'b'); % For Rectangle AEFG
    plot3(xc,yc,zc,'go'); % For P_cm

%     axis equal;
    view([45 45 45]);
    grid on;
    xlabel("x");
    ylabel("y");
    zlabel("z");
    str = sprintf('v');
    title(str);
    xlim([-2 12]);
    ylim([-2 12]);
    zlim([-12 2]);

    drawnow
end
