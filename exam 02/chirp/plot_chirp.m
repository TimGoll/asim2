clc;
clear;
close ALL;

a = sim('chirp_test', 'SimulationMode', 'normal');
figure('Name', 'Chirp test');
plot(a.get('time'), a.get('chirp'), 'Linewidth', 2);
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s] and Frequency [Hz]';
set(gca, 'FontSize', 20);