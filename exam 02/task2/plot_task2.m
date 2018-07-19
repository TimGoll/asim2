clc;
clear;
close ALL;




param_v = 0;
param_f = 0.001;
param_N = 8;
param_l1 = 0.0164;
param_y2  = -1.135*10^-4;
param_y1  = 0.0164 + param_y2;
param_ys0 = 0.02;
param_k1  = 10800;
param_k2  = 43200;
param_m1  = 0.25;
param_m2  = 0.25;
param_g   = 9.81;

a = sim('DEA_strip_t2', 'SimulationMode', 'normal');

figure('Name', 'y_1 - time');
plot(a.get('time'), a.get('y_1'), 'Linewidth', 2, 'DisplayName', 'y_1');
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s]';
set(gca, 'FontSize', 20);
legend('show');
%hold on;
%param_v = 2500;
a = sim('DEA_strip_t2', 'SimulationMode', 'normal');
figure('Name', 'y_2 - time');
plot(a.get('time'), a.get('y_2'), 'Linewidth', 2, 'DisplayName', 'y_2');

grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s]';
set(gca, 'FontSize', 20);
legend('show');