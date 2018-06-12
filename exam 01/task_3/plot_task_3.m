close ALL;
clc;

%% DEFINE PARAMETER
Parameter_PC2;
param_N                = 20;
params_PC2.L0          = 0.75;
param_preload          = 0.05;
param_m                = 0.3;
param_b                = 10;
param_k                = 500;
params_PC2.delta_T     = 80;
param_J0_yin           = 0.7845;

param_J = params_PC2.alpha * 2 * pi * params_PC2.r0 * params_PC2.L0 * param_N * params_PC2.delta_T;

%% SIMULATE
a = sim('SMA_displacementIn_PC2','SimulationMode','normal');

%% PLOT
figure('Name', 'SMA actuator [Force-Displacement SMA]');

%plot(a.get('time'), a.get('temperature'), 'Linewidth', 2);

%hold on;
plot(a.get('time'), a.get('normalized_stroke'), 'Linewidth', 2);



xlabel 'Displacement [m]';
ylabel 'Force [N]';
grid;
grid minor;
set(gca, 'FontSize', 14);
