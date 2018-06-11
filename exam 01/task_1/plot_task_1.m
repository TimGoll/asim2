close ALL;
clc;

%% DEFINE PARAMETER
Parameter_PC2;
<<<<<<< HEAD
param_N = 100;
param_Li = 1;
||||||| merged common ancestors
param_N = 1;
param_Li = 0.1;
=======
params_PC2.delta_T = 80;

arr_N = [1 2 3];
arr_L = [0.08 0.1 0.12];
>>>>>>> 2469444c94d40c53a330725d9e93a8f18cb5e767

%% SIMULATE

%% PLOT


% figure('Name', 'SMA actuator [Time-Temperature]');
% plot(a.get('time'), a.get('temperature'), 'Linewidth', 2);
% grid;
% grid minor;
% xlabel 'Time [s]';
% ylabel 'Temperatire [K]';
% set(gca, 'FontSize', 14);

figure('Name', 'SMA actuator [Force-Displacement SMA]');
for param_N = arr_N
    for param_Li = arr_L
        
        param_J = params_PC2.alpha * 2 * pi * params_PC2.r0 * param_Li * param_N * params_PC2.delta_T;
        params_PC2.L0 = param_Li; %overwrite value for the SMA block
        disp(params_PC2.L0);
        a = sim('SMA_displacementIn_PC2','SimulationMode','normal');
        
        if (~(param_N == arr_N(1) && param_Li == arr_L(1))) %print hold on not in the first place
            disp('hold on');
            hold on; 
        end
        
        plot(a.get('Displacement'), a.get('F_TOT'), 'Linewidth', 2, 'DisplayName', 'N=' + string(param_N) + ', L=' + string(param_Li));
        
    end
end
grid minor;
xlabel 'Displacement [m]';
ylabel 'Force [N]';
set(gca, 'FontSize', 14);
legend('show')