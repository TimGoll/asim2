<<<<<<< HEAD
_%% DEFINE PARAMETER
Parameter_PC2;
param_N = 10;
||||||| merged common ancestors
%% DEFINE PARAMETER
N = 10;
=======
close ALL;
clc;

%% DEFINE PARAMETER
Parameter_PC2;
param_N = 10;
param_Li = 0.1;
param_y0 = -0.04;
>>>>>>> 2469444c94d40c53a330725d9e93a8f18cb5e767

%% SIMULATE
a = sim('SMA_displacementIn_PC2','SimulationMode','normal');

%% PLOT
figure('Name', 'SMA actuator [Force-Displacement SMA]');

plot(a.get('Displacement'), a.get('F_TOT'), 'Linewidth', 2);

hold on;
plot(a.get('Displacement'), a.get('Spring_Force'), 'Linewidth', 2);



xlabel 'Displacement [m]';
ylabel 'Force [N]';
grid;
grid minor;
set(gca, 'FontSize', 14);
