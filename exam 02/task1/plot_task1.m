clc;
clear ALL;

Parameter_t1; %load all params

param_v = 0;
param_f = 0.001;

a = sim('DEA_strip_t1', 'SimulationMode', 'normal');

figure('Name', 'DEA 0V');
plot(a.get('strain'), a.get('stress'), 'Linewidth', 2);
grid;
grid minor;
xlabel 'Strain [%]';
ylabel 'Stress [Pa]';
set(gca, 'FontSize', 14);

figure('Name', 'DEA 0V, length');
plot(a.get('time'), a.get('length'), 'Linewidth', 2);
grid;
grid minor;
xlabel 'Strain [%]';
ylabel 'Stress [Pa]';
set(gca, 'FontSize', 14);