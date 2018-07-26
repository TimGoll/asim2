clc;
clear;
close ALL;



param_simtime = 1000;
param_v = 0;
param_f = 0.001;
param_f_res = 34.5;
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

a = sim('DEA_strip_t8', 'SimulationMode', 'normal');

figure('Name', 'power - time');
plot(a.get('time'), a.get('power') ./ a.get('time'), 'b', 'Linewidth', 2, 'DisplayName', 'Power vs. Time');

grid minor;
ylabel 'Power [W]';
xlabel 'Time [s]';
set(gca, 'FontSize', 20);
%legend('show');
ylim([0 5]);


figure('Name', 'efficiency - time');
plot(a.get('time'), a.get('eta'), 'b', 'Linewidth', 2, 'DisplayName', 'Efficiency vs. Time');

grid minor;
ylabel 'Efficiency []';
xlabel 'Time [s]';
set(gca, 'FontSize', 20);
%legend('show');
ylim([0 5]);
