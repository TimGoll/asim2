clc;
clear ALL;
close ALL;

Parameter_t1; %load all params


param_v = 0;
param_f = 0.001;
param_N = 8;

param_y2  = -1.135*10^-4;
param_ys0 = 0;
param_k1  = 10800;
param_m1  = 0.25;
param_g   = 9.81;

a = sim('DEA_strip_t1', 'SimulationMode', 'normal');

figure('Name', 'DEA Force-Displacement');
plot(a.get('displacement'), a.get('force'), 'Linewidth', 2, 'DisplayName', '0V');
hold on;
param_v = 2500;
a = sim('DEA_strip_t1', 'SimulationMode', 'normal');
plot(a.get('displacement'), a.get('force'), 'Linewidth', 2, 'DisplayName', '2500V');
plot(a.get('displacement'), a.get('spring_force'), 'Linewidth', 2, 'DisplayName', 'spring');
grid;
grid minor;
ylabel 'Force [N]';
xlabel 'Displacement [mm]';
set(gca, 'FontSize', 14);
legend('show');