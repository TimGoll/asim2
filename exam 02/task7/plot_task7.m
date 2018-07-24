clc;
clear;
close ALL;

Parameter; %load all params

param_g   = 9.81;
param_f   = 0.001;
param_N   = 8;
param_k1  = 0;
param_k2  = 43200;
param_m1  = 0.25;
param_m2  = 0.25;

param_y2  = (-param_g * (param_m1 + param_m2)) / param_k2;

param_ys0 = 0;
param_v = 0;

d1 = sim('DEA_strip_t1', 'SimulationMode', 'normal');

figure('Name', 'DEA Force-Displacement - negative Spring');
plot(d1.get('length'), d1.get('force'), 'Linewidth', 2, 'DisplayName', 'V_{DEA}=0V');
hold on;

param_v = 2500;
d2 = sim('DEA_strip_t1', 'SimulationMode', 'normal');
plot(d2.get('length'), d2.get('force'), 'Linewidth', 2, 'DisplayName', 'V_{DEA}=2500V');

param_k1 = -1000;
a = sim('DEA_strip_t1', 'SimulationMode', 'normal');
plot(a.get('length'), a.get('bias_force'), 'Linewidth', 2, 'DisplayName', 'k_1=' + string(param_k1) + '^{N}/_{m}');

param_k1 = -5000;
a = sim('DEA_strip_t1', 'SimulationMode', 'normal');
plot(a.get('length'), a.get('bias_force'), 'Linewidth', 2, 'DisplayName', 'k_1=' + string(param_k1) + '^{N}/_{m}');

param_k1 = -8000;
a = sim('DEA_strip_t1', 'SimulationMode', 'normal');
plot(a.get('length'), a.get('bias_force'), 'Linewidth', 2, 'DisplayName', 'k_1=' + string(param_k1) + '^{N}/_{m}');


%ylim([0 10]);
grid;
grid minor;
ylabel 'Force [N]';
xlabel 'length [m]';
set(gca, 'FontSize', 20);
legend('show');



param_k1 = -5000;

figure('Name', 'DEA Force-Displacement - negative Spring, y_s0');
hold on;
plot(d1.get('length'), d1.get('force'), 'Linewidth', 2, 'DisplayName', 'V_{DEA}=0V');
plot(d2.get('length'), d2.get('force'), 'Linewidth', 2, 'DisplayName', 'V_{DEA}=2500V');

a = sim('DEA_strip_t1', 'SimulationMode', 'normal');
plot(a.get('length'), a.get('bias_force'), 'Linewidth', 2, 'DisplayName', 'k_1=' + string(param_k1) + '^{N}/_{m}, y_{s0}='+ string(param_ys0) + 'm');

param_ys0 = 0.003;
a = sim('DEA_strip_t1', 'SimulationMode', 'normal');
plot(a.get('length'), a.get('bias_force'), 'Linewidth', 2, 'DisplayName', 'k_1=' + string(param_k1) + '^{N}/_{m}, y_{s0}='+ string(param_ys0) + 'm');

param_ys0 = 0.006;
a = sim('DEA_strip_t1', 'SimulationMode', 'normal');
plot(a.get('length'), a.get('bias_force'), 'Linewidth', 2, 'DisplayName', 'k_1=' + string(param_k1) + '^{N}/_{m}, y_{s0}='+ string(param_ys0) + 'm');

param_ys0 = 0.009;
a = sim('DEA_strip_t1', 'SimulationMode', 'normal');
plot(a.get('length'), a.get('bias_force'), 'Linewidth', 2, 'DisplayName', 'k_1=' + string(param_k1) + '^{N}/_{m}, y_{s0}='+ string(param_ys0) + 'm');



%ylim([0 10]);
grid;
grid minor;
ylabel 'Force [N]';
xlabel 'length [m]';
set(gca, 'FontSize', 20);
legend('show');