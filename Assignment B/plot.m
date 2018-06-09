figure('Name', 'SMA actuator [Force-Displacement]');
plot(Displacement, F_TOT, 'Linewidth', 2);
grid;
grid minor;
xlabel 'Displacement [m]';
ylabel 'Force [N]';
set(gca, 'FontSize', 14);
