%% DEFINE PARAMETER
N = 10;

%% SIMULATE
a = sim('SMA_displacementIn_PC2','SimulationMode','normal');

%% PLOT
figure('Name', 'SMA actuator [Force-Displacement SMA]');

plot(a.get('Displacement'), a.get('F_TOT'), 'Linewidth', 2);

hold on;
plot(a.get('Displacement'), a.get('Spring_Force'), 'Linewidth', 2);



xlabel 'Displacement [m]';
ylabel 'Force [N]';
grid;
grid minor;
set(gca, 'FontSize', 14);
