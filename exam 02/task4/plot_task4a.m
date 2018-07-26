%set this variable to true, if the workspace should be cleared and the
%simulation should be rerun
doSimulation = false;

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
param_l1 = 0.0164;
param_y2  = -1.135*10^-4;
param_y1  = 0.0164 + param_y2;
param_ys0 = 0.02;
param_k1  = 10800;
param_k2  = 43200;
param_m1  = 0.25;
param_m2  = 0.25;
param_g   = 9.81;

if (doSimulation == true)
    a = sim('DEA_strip_t4a', 'SimulationMode', 'normal');
    b = sim('DEA_strip_t3a', 'SimulationMode', 'normal');
end

figure('Name', 'y_1 - time/frequency');
plot(a.get('time'), a.get('y_1'), 'Linewidth', 2, 'DisplayName', 'y_1');
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([0.014 0.020]);


figure('Name', 'y_2 - time/frequency');
plot(a.get('time'), a.get('y_2'), 'Linewidth', 2, 'DisplayName', 'y_2');
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
xlim([0 param_simtime]);
ylim([-0.002 0.002]);






figure('Name', 'y_1 - time/frequency COMBINED');
hold on;
plot(b.get('time'), b.get('y_1'), 'Linewidth', 2, 'DisplayName', 'y_1 - normal sinesweep');
plot(a.get('time'), a.get('y_1'), 'Linewidth', 2, 'DisplayName', 'y_1 - sqaure rooted sinesweep');
grid;
grid minor;
ylabel 'y_1 [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
legend('show');
xlim([0 param_simtime]);
ylim([0.014 0.020]);

figure('Name', 'y_2 - time/frequency COMBINED');
hold on;
plot(b.get('time'), b.get('y_2'), 'Linewidth', 2, 'DisplayName', 'y_2 - normal sinesweep');
plot(a.get('time'), a.get('y_2'), 'Linewidth', 2, 'DisplayName', 'y_2 - sqaure rooted sinesweep');
grid;
grid minor;
ylabel 'y_2 [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);
legend('show');
xlim([0 param_simtime]);
ylim([-0.002 0.002]);