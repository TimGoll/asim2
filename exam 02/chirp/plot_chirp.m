clc;
clear;
close ALL;

param_simtime = 10;
param_f_res = 0.5;

a = sim('chirp_test', 'SimulationMode', 'normal');
figure('Name', 'Chirp test');
plot(a.get('time'), a.get('chirp'), 'Linewidth', 2);
grid;
grid minor;
ylabel 'Displacement [m]';
xlabel 'Time [s]';
xlim([0 param_simtime]);
set(gca, 'FontSize', 20);

figure('Name', 'pwm test');
plot(a.get('time'), a.get('pwm'), 'Linewidth', 2);
grid;
grid minor;
ylabel 'Voltage [V]';
xlabel 'Time [s]';
xlim([0 param_simtime]);
set(gca, 'FontSize', 20);

figure('Name', 'triangle test');
plot(a.get('time'), a.get('triangle'), 'Linewidth', 2);
grid;
grid minor;
ylabel 'Voltage [V]';
xlabel 'Time [s]';
xlim([0 param_simtime]);
set(gca, 'FontSize', 20);

figure('Name', 'sawtooth test');
plot(a.get('time'), a.get('sawtooth'), 'Linewidth', 2);
grid;
grid minor;
ylabel 'Voltage [V]';
xlabel 'Time [s]';
xlim([0 param_simtime]);
set(gca, 'FontSize', 20);

figure('Name', 'sinus test');
plot(a.get('time'), a.get('sinus'), 'Linewidth', 2);
grid;
grid minor;
ylabel 'Voltage [V]';
xlabel 'Time [s]';
xlim([0 param_simtime]);
set(gca, 'FontSize', 20);