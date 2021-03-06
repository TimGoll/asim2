clc;
clear;
close ALL;

Parameter; %load all params

param_g   = 9.81;
param_f   = 0.001;
param_N   = 8;
param_k1  = 10800;
param_k2  = 43200;
param_m1  = 0.25;
param_m2  = 0.25;

param_y2  = (-param_g * (param_m1 + param_m2)) / param_k2;

param_ys0 = 0;
param_v = 0;

a = sim('DEA_strip_t1', 'SimulationMode', 'normal');

figure('Name', 'DEA Force-Displacement [0V]');
plot(a.get('length'), a.get('force'), 'Linewidth', 2, 'DisplayName', 'V_{DEA}=0V');
hold on;

param_v = 2500;
a = sim('DEA_strip_t1', 'SimulationMode', 'normal');
plot(a.get('length'), a.get('force'), 'Linewidth', 2, 'DisplayName', 'V_{DEA}=2500V');

param_ys0 = 0.016;
a = sim('DEA_strip_t1', 'SimulationMode', 'normal');
plot(a.get('length'), a.get('bias_force'), 'Linewidth', 2, 'DisplayName', 'Bias, y_{s0}=' + string(param_ys0) + 'm');

param_ys0 = 0.020;
a = sim('DEA_strip_t1', 'SimulationMode', 'normal');
plot(a.get('length'), a.get('bias_force'), 'Linewidth', 2, 'DisplayName', 'Bias, y_{s0}=' + string(param_ys0) + 'm');

param_ys0 = 0.024;
a = sim('DEA_strip_t1', 'SimulationMode', 'normal');
plot(a.get('length'), a.get('bias_force'), 'Linewidth', 2, 'DisplayName', 'Bias, y_{s0}=' + string(param_ys0) + 'm');







ylim([0 10]);
grid;
grid minor;
ylabel 'Force [N]';
xlabel 'length [m]';
set(gca, 'FontSize', 20);
legend('show');
