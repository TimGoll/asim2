%close ALL;
clc;
clear;

Parameter;


a = sim('DEA_b', 'SimulationMode', 'normal');


figure('Name', 'SMA actuator 0V [Time-Stress]');
plot(time, displacement, 'Linewidth', 2, 'DisplayName', 'measured');
hold on;
plot(a.get('time'), a.get('displacement'), 'Linewidth', 2, 'DisplayName', 'simulated');
grid;
grid minor;
xlabel 'Time [s]';
ylabel 'Stress [Pa]';
set(gca, 'FontSize', 14);
legend('show')