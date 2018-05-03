%% Force-Displacement calculation and plot

function [strain, stress] = strain_stress(displacement, force, length, diameter)

strain = (displacement - length) / length;
stress = force / (pi * (diameter / 2)^2) / (10^9);

figure('Name', 'Strain-Stress graph');
plot(strain, stress, 'Linewidth', 1);
grid;
grid minor;
xlabel 'Strain [%]';
ylabel 'Stress [GPa]';
set(gca, 'FontSize', 14);

end