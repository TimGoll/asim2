close ALL;
clc;

%% DEFINE PARAMETER
Parameter_PC2;
params_PC2.delta_T = 80;
param_N            = 150;
params_PC2.L0      = 1.2;

param_J = params_PC2.alpha * 2 * pi * params_PC2.r0 * params_PC2.L0 * param_N * params_PC2.delta_T;

param_K            = 500;
param_y0           = -0.6;

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
