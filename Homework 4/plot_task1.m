figure('Name', 'SMA actuator [Force-Displacement]');
plot(displacement, force, 'Linewidth', 2);
grid;
grid minor;
xlabel 'Displacement [m]';
ylabel 'Force [N]';
set(gca, 'FontSize', 14);

figure('Name', 'SMA actuator [Temperature-Time]');
plot(time, temperature, 'Linewidth', 2);
grid;
grid minor;
xlabel 'Temperature [K]';
ylabel 'Time [s]';
set(gca, 'FontSize', 14);