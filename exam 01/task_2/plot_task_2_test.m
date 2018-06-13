close ALL;
clc;

%% DEFINE PARAMETER
Parameter_PC2;
params_PC2.delta_T = 80;

param_N            = 1;
params_PC2.L0      = 0.75;

param_J = params_PC2.alpha * 2 * pi * params_PC2.r0 * params_PC2.L0 * param_N * params_PC2.delta_T;

param_K            = 500;
param_preload_0    = 0.02;
param_preload_1    = 0.05; %chosen one
param_preload_2    = 0.08;
param_preload      = 0;

%% SIMULATE AND PLOT
figure('Name', 'SMA actuator [Force-Displacement SMA]');

a = sim('SMA_displacementIn_PC2_2','SimulationMode','normal');
plot(a.get('Displacement'), a.get('F_TOT'), 'Linewidth', 2, 'DisplayName', 'J_{max} [N=' + string(param_N) + ', L=' + string(params_PC2.L0) + ']');

hold on;
param_J = 0;
a = sim('SMA_displacementIn_PC2_2','SimulationMode','normal');
plot(a.get('Displacement'), a.get('F_TOT'), 'Linewidth', 2, 'DisplayName', 'J_{0} [N=' + string(param_N) + ', L=' + string(params_PC2.L0) + ']');

hold on;
param_preload = 0.035;
a = sim('SMA_displacementIn_PC2_2','SimulationMode','normal');
plot(a.get('Displacement'), a.get('Spring_Force'), 'Linewidth', 2, 'DisplayName', 'Spring [K=' + string(param_K) + 'N/m, y0=' + string(param_preload) + 'm');


xlabel 'Displacement [m]';
ylabel 'Force [N]';
grid;
grid minor;
set(gca, 'FontSize', 14);
