close ALL;
clc;

%% DEFINE PARAMETER
Parameter_PC2;
params_PC2.delta_T = 80;
param_N            = 20;
params_PC2.L0      = 0.75;

param_J = params_PC2.alpha * 2 * pi * params_PC2.r0 * params_PC2.L0 * param_N * params_PC2.delta_T;

param_K            = 500;
param_y0           = -0.05;

%% SIMULATE AND PLOT
figure('Name', 'SMA actuator [Force-Displacement SMA]');

a = sim('SMA_displacementIn_PC2','SimulationMode','normal');
plot(a.get('Displacement'), a.get('F_TOT'), 'Linewidth', 2, 'DisplayName', 'J_{max}');

hold on;
param_J = 0;
a = sim('SMA_displacementIn_PC2','SimulationMode','normal');
plot(a.get('Displacement'), a.get('F_TOT'), 'Linewidth', 2, 'DisplayName', 'J_0');

hold on;
plot(a.get('Displacement'), a.get('Spring_Force'), 'Linewidth', 2, 'DisplayName', 'Spring');



xlabel 'Displacement [m]';
ylabel 'Force [N]';
grid;
grid minor;
set(gca, 'FontSize', 14);
legend('show')
