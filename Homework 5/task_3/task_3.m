close ALL;
clc;
clear;

[time, strain, stress] = read_and_parse('DE_relaxation_0V');

Parameter;

params_voltage = 0;
param_f = 1;

a = sim('DE_epsIn_task_3', 'SimulationMode', 'normal');

figure('Name', 'SMA actuator [Time-Stress]');
plot(stress, strain, 'Linewidth', 2, 'DisplayName', 'measured');
hold on;
plot(a.get('stress'), a.get('strain'), 'Linewidth', 2, 'DisplayName', 'simulated');
grid;
grid minor;
xlabel 'Stress [Pa]';
ylabel 'Strain [%]';
set(gca, 'FontSize', 14);
legend('show')





function [time, strain, stress] = read_and_parse(filepath)

fileID = fopen(filepath, 'r');
A = fscanf(fileID, '%f', [3, Inf]);

time   = A(1,:);
strain = A(2,:);
stress = A(3,:);

end