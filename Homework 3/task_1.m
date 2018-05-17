frequency = 0.01;
a = sim('SMA_displacementIn_edit','SimulationMode','normal');

figure('Name', 'SMA displacement [0.01Hz]');
plot(a.force, a.displacement, 'Linewidth', 1);
grid;
grid minor;
xlabel 'Force [N]';
ylabel 'Displacement';
set(gca, 'FontSize', 14);