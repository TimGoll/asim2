%frequency = 0.01;
%a = sim('SMA_displacementIn_edit','SimulationMode','normal');

figure('Name', 'SMA mass actuator');
%plot(time, force, 'Linewidth', 2);
plot(time, displacement, 'Linewidth', 2);

grid;
grid minor;
xlabel 'Time [s]';
ylabel 'Force [N]';
set(gca, 'FontSize', 14);