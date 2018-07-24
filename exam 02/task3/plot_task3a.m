%set this variable to true, if the workspace should be cleared and the
%simulation should be rerun
doSimulation = false;

if (doSimulation == true)
    clc;
    clear;
    doSimulation = true;
end
close ALL;

param_simtime = 500;

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
    set_param('DEA_strip_t3a', 'StopTime', param_simtime');
    a = sim('DEA_strip_t3a', 'SimulationMode', 'normal');
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

figure('Name', 'y_1 and y2 combined - time/frequency');
hold on;
plot(a.get('time'), a.get('y_1'), 'Linewidth', 2, 'DisplayName', 'y_1');
plot(a.get('time'), a.get('y_2'), 'Linewidth', 2, 'DisplayName', 'y_2');
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
legend('show');
