figure('Name', 'SMA displacement-temperature]');
plot(displacement, temperature, 'Linewidth', 2);
grid;
grid minor;
xlabel 'Displacement [m]';
ylabel 'Temperature [K]';
set(gca, 'FontSize', 14);


figure('Name', 'SMA resistance-displacement');
plot(resistance, displacement , 'Linewidth', 2);
grid;
grid minor;
xlabel 'Resistance [ohm]';
ylabel 'Displacement [m]';
set(gca, 'FontSize', 14);
