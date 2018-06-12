close ALL;
clc;

%% DEFINE PARAMETER
Parameter_PC2;
params_PC2.delta_T = 80;

arr_N = [1 2 3];
arr_L = [0.075 0.1 0.125];

%% SIMULATE

%% PLOT

% define figure Windows
figures = [];

for param_Li = arr_L
   
    figures = [figures figure('Name', 'SMA actuator [Force-Displacement SMA], [J=0, L=' + string(param_Li) + ']')];
    figures = [figures figure('Name', 'SMA actuator [Force-Displacement SMA], [J_{max}, L=' + string(param_Li) + ']')];
    figures = [figures figure('Name', 'SMA actuator [Time-Temperature SMA], [J_{max}, L=' + string(param_Li) + ']')];
    
end

% figure('Name', 'SMA actuator [Time-Temperature]');
% plot(a.get('time'), a.get('temperature'), 'Linewidth', 2);
% grid;
% grid minor;
% xlabel 'Time [s]';
% ylabel 'Temperatire [K]';
% set(gca, 'FontSize', 14);

counter = 1;
for param_Li = arr_L
    for param_N = arr_N
        
        params_PC2.L0 = param_Li; %overwrite value for the SMA block
        
        param_J = 0;
        a = sim('SMA_displacementIn_PC2','SimulationMode','normal');
        figure(figures(counter)); hold on;
        plot(a.get('Displacement'), a.get('F_TOT'), 'Linewidth', 2, 'DisplayName', 'N=' + string(param_N) + ', J=' + string(param_J) + 'W');
        
        grid minor;
        xlabel 'Displacement [m]';
        ylabel 'Force [N]';
        set(gca, 'FontSize', 14);
        legend('show', 'Location','northeast')
        
        param_J = params_PC2.alpha * 2 * pi * params_PC2.r0 * params_PC2.L0 * param_N * params_PC2.delta_T;
        a = sim('SMA_displacementIn_PC2','SimulationMode','normal');
        figure(figures(counter+1)); hold on;
        plot(a.get('Displacement'), a.get('F_TOT'), 'Linewidth', 2, 'DisplayName', 'N=' + string(param_N) + ', J=' + string(param_J) + 'W');
        
        grid minor;
        xlabel 'Displacement [m]';
        ylabel 'Force [N]';
        set(gca, 'FontSize', 14);
        legend('show', 'Location','northeast')
        
        figure(figures(3)); hold on;
        plot(a.get('time'), a.get('temperature'), 'Linewidth', 2, 'DisplayName', 'N=' + string(param_N) + ', L=' + string(param_Li) + 'm, J=' + string(param_J) + 'W');
        
        grid minor;
        xlabel 'Time [s]';
        ylabel 'Temperature [K]';
        set(gca, 'FontSize', 14);
        legend('show', 'Location','southeast')
        
    end
    counter = counter+3;
end