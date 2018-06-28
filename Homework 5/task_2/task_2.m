[time, strain, stress] = read_and_parse('../DE_relaxation_0V');

figure('Name', 'SMA actuator [Time-Strain]');
plot(time, strain, 'Linewidth', 2);
grid;
grid minor;
xlabel 'Time [s]';
ylabel 'Strain [%]';
set(gca, 'FontSize', 14);

figure('Name', 'SMA actuator [Time-Stress]');
plot(time, stress, 'Linewidth', 2);
grid;
grid minor;
xlabel 'Time [s]';
ylabel 'Stress [GPa]';
set(gca, 'FontSize', 14);







function [time, strain, stress] = read_and_parse(filepath)

fileID = fopen(filepath, 'r');
A = fscanf(fileID, '%f', [3, Inf]);

time   = A(1,:);
strain = A(2,:);
stress = A(3,:);

end