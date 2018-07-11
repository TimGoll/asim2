%close ALL;
clc;
clear;

Parameter;


a = sim('DEA_c', 'SimulationMode', 'normal');


figure('Name', 'displacement over time [mass + LBS + NBS]');
hold on;
plot(a.get('time'), a.get('displacement'), 'Linewidth', 2, 'DisplayName', 'simulated');
grid;
grid minor;
xlabel 'Time [s]';
ylabel 'displacement [m]';
set(gca, 'FontSize', 14);
legend('show')