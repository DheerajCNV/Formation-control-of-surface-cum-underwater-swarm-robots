%% Plots
tiledlayout(1,2)

nexttile
plot(t_out,S_out(:,2));
title("Angular Velocity vs time");
xlabel("Time(sec)");
ylabel("Angular Velocity (rad/sec) ");
axis equal;

nexttile
plot(t_out,S_out(:,1));
title("Angular Postion vs time");
xlabel("Time(sec)");
ylabel("Angular Postion (rad) ");
axis equal;