%% Convetrs components of ground frame velocities of the craft from bodyframe to groundframe with euler method and gets the coordinates in the ground frame.
clc;

eta_0 = [ 0
          0
          0
          0
          0
          0 ]; % Initial state

num_pts = 500;
t_span = linspace(0,10,num_pts);

options = odeset('reltol',1e-9,'abstol',1e-9);

[t_out, eta_out] = ode45(@(t,eta)V_P(t,eta), t_span, eta_0, options);

tot = [t_out, eta_out];

%%
function eta_dot = V_P (t,eta)

phi = eta(4);
theta = eta(5);
psi = eta(6);

eta_dot = zeros(6,1);

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

v = f_v(t);

eta_dot = (J*v);

end

%% velocity Funcion

function v = f_v(t)
v = [1;0;0;2*pi/10;0;0];
end





