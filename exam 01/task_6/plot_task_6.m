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

param_factor           = 0.0137;

param_lin_a0           = 0.092;
param_lin_a1           = - 7/675;
param_lin_q_max        = 0.014;
%param_con_P            = 0.45*3;
%param_con_I            = param_con_P/(0.85*3);
param_con_P            = 0.45*2.2;
param_con_I            = param_con_P/(0.85*0.9);

param_J = params_PC2.alpha * 2 * pi * params_PC2.r0 * params_PC2.L0 * param_N * params_PC2.delta_T;
%% SIMULATE
a = sim('SMA_displacementIn_PC2_6','SimulationMode','normal');

%% PLOT

figure('Name', 'SMA valve J_ref, J_current');

plot(a.get('time'), a.get('temperature'), 'Linewidth', 2, 'DisplayName', 'time-temperature');

xlabel 'Time [s]';
ylabel 'Temperature [K]';

grid;
grid minor;
set(gca, 'FontSize', 14);
legend('show');


figure('Name', 'SMA valve q_ref');

plot(a.get('time'), a.get('R_TOT'), 'Linewidth', 2, 'DisplayName', 'time-resistance');


xlabel 'Time [s]';
ylabel 'Resistance [Ohm]';

grid;
grid minor;
set(gca, 'FontSize', 14);
legend('show');

figure('Name', 'SMA valve q_ref');

plot(a.get('time'), a.get('normalized_stroke'), 'Linewidth', 2, 'DisplayName', 'time-normalized_stroke');


xlabel 'Time [s]';
ylabel 'Stroke[%]';

grid;
grid minor;
set(gca, 'FontSize', 14);
legend('show');

