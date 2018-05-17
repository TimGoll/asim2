frequency_arr = [0.01 0.04 0.1 0.25 1]; %Hz

J = 0.2;

for i = 1:1:length(frequency_arr)
    disp(i);
    frequency = frequency_arr(i);
    plot__(frequency_arr(i));
end

function [] = plot__ (frequency) 

a = sim('SMA_displacementIn_edit','SimulationMode','normal');

figure('Name', 'SMA displacement [' + string(frequency) + 'Hz]');
plot(a.get('displacement'), a.get('force'), 'Linewidth', 2);
grid;
grid minor;
xlabel 'Displacement [m]';
ylabel 'Force [N]';
set(gca, 'FontSize', 14);
xlim([0.1 0.107]);
ylim([0 4.5]);

end