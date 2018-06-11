%% DEFINE PARAMETER
Parameter_PC2;
param_N = 100;
param_Li = 1;

%% SIMULATE
a = sim('SMA_displacementIn_PC2','SimulationMode','normal');

%% PLOT
figure('Name', 'SMA actuator [Force-Displacement SMA]');
plot(a.get('Displacement'), a.get('F_TOT'), 'Linewidth', 2);
grid;
grid minor;
xlabel 'Displacement [m]';
ylabel 'Force [N]';
set(gca, 'FontSize', 14);

figure('Name', 'SMA actuator [Time-Temperature]');
plot(a.get('time'), a.get('temperature'), 'Linewidth', 2);
grid;
grid minor;
xlabel 'Time [s]';
ylabel 'Temperatire [K]';
set(gca, 'FontSize', 14);