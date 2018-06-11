%% DEFINE PARAMETER
Parameter_PC2;
param_N = 10;
param_J_TOT = 4;

%% SIMULATE
a = sim('SMA_displacementIn_PC2','SimulationMode','normal');

%% PLOT
figure('Name', 'SMA actuator [Force-Displacement SMA]');

plot(a.get('temperature'), a.get('time'), 'Linewidth', 2);

hold on;
plot(a.get('normalized_stroke'), a.get('time'), 'Linewidth', 2);



xlabel 'Displacement [m]';
ylabel 'Force [N]';
grid;
grid minor;
set(gca, 'FontSize', 14);
