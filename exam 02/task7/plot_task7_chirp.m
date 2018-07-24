%set this variable to true, if the workspace should be cleared and the
%simulation should be rerun
doSimulation = true;

if (doSimulation == true)
    clc;
    clear;
    doSimulation = true;
end
close ALL;

param_simtime = 55;

param_v = 0;
param_f = 0.001;
param_N = 8;
param_l1 = 0.0105; %length at 0V
param_y2  = -1.135*10^-4;%
param_y1  = param_l1 + param_y2;%
param_ys0 = 0.009;
param_k1  = -5000;
param_k2  = 43200;
param_m1  = 0.25;
param_m2  = 0.25;
param_g   = 9.81;

if (doSimulation == true)
    a = sim('DEA_strip_t7_chirp', 'SimulationMode', 'normal');
end

figure('Name', 'y_1 - time/frequency');

plot(a.get('time'), a.get('y_1'), 'Linewidth', 2);
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);


figure('Name', 'y_2 - time/frequency');
plot(a.get('time'), a.get('y_2'), 'Linewidth', 2);
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);

param_v = 0;
param_f = 0.001;
param_N = 8;
param_l1 = 0.0164;
param_y2  = -1.135*10^-4;
param_y1  = param_l1 + param_y2;
param_ys0 = 0.02;
param_k1  = 10800;
param_k2  = 43200;
param_m1  = 0.25;
param_m2  = 0.25;
param_g   = 9.81;

if (doSimulation == true)
    b = sim('DEA_strip_t3a', 'SimulationMode', 'normal');
end

figure('Name', 'y_1 - time/frequency // combined');
hold on;
plot(b.get('time'), b.get('y_1'), 'Linewidth', 2, 'DisplayName', 'positive spring');
plot(a.get('time'), a.get('y_1'), 'Linewidth', 2, 'DisplayName', 'negative spring');
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);


figure('Name', 'y_2 - time/frequency // combined');
hold on;
plot(b.get('time'), b.get('y_2'), 'Linewidth', 2, 'DisplayName', 'positive spring');
plot(a.get('time'), a.get('y_2'), 'Linewidth', 2, 'DisplayName', 'negative spring');
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);