clc; clear all; close all;
num_pts = 500;
t_span = linspace(0,10,num_pts);

eta_0 = [ 0
          0
          0
          0
          0
          0 ];

options = odeset('reltol',1e-9,'abstol',1e-9);

[t_out, eta_out] = ode45(ode_f, t_span, eta_0, options);

tot = [t_out, eta_out];

V = zeros(7,length(t_span));

for i = length(tspan)
    eta = eta_out(i,1);
    vt = V_P(t_span(i),eta);

    V(i,:) = vt';
end


%%

function eta_dot = ode_f(t)

    eta_dot = [0.8; 0.8; 0.8; 0.8; 0.8; 0.8];

end

%%
function vt = V_P (t,eta)

phi = eta(4);
theta = eta(5);
psi = eta(6);

v = zeros(6,1);

Cpsi = [cos(psi) -sin(psi) 0
        sin(psi)  cos(psi) 0
        0          0       1];

Ctheta = [cos(theta)   0   sin(theta)
           0           1      0   
         -sin(theta)   0   cos(theta)];

Cphi = [1    0         0
        0 cos(phi) -sin(phi)
        0 sin(phi) cos(phi)];

J1 = Cpsi*Ctheta*Cphi;

J2= [1  sin(phi)*tan(theta)  cos(phi)*tan(theta)
     0      cos(phi)              -sin(phi)
     0 sin(phi)/cos(theta)   cos(phi)/cos(theta)]; 

J = [J1 zeros(3,3)
    zeros(3,3) J2];

eta_dot = [0.8; 0.8; 0.8; 0.8; 0.8; 0.8];

v = J\eta_dot;

vt = [v;t];

end