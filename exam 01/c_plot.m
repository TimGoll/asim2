figure('Name', 'SMA actuator [Force-Displacement SMA]');
plot(Displacement, F_TOT, 'Linewidth', 2);
grid;
grid minor;
xlabel 'Displacement [m]';
ylabel 'Force [N]';
set(gca, 'FontSize', 14);


figure('Name', 'SMA actuator [Force-Displacement Spring]');
plot(Displacement, Spring_Force, 'Linewidth', 2);
grid;
grid minor;
xlabel 'Displacement [m]';
ylabel 'Force [N]';
set(gca, 'FontSize', 14);
