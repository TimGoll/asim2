close ALL;
clc;
clear;

Parameter;

[time, strain, stress] = read_and_parse('../DE_relaxation_0V');

params_voltage = 2000;

a = sim('DE_epsIn_task_2', 'SimulationMode', 'normal');


figure('Name', 'SMA actuator 2000V [Time-Stress]');
plot(time, stress, 'Linewidth', 2, 'DisplayName', 'measured');
hold on;
plot(a.get('time'), a.get('stress'), 'Linewidth', 2, 'DisplayName', 'simulated');
grid;
grid minor;
xlabel 'Time [s]';
ylabel 'Stress [Pa]';
set(gca, 'FontSize', 14);
legend('show')





function [time, strain, stress] = read_and_parse(filepath)

fileID = fopen(filepath, 'r');
A = fscanf(fileID, '%f', [3, Inf]);

time   = A(1,:);
strain = A(2,:);
stress = A(3,:);

end