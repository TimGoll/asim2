%% Force-Displacement calculation and plot

function [strain, stress] = strain_stress(id, displacement, force, length, diameter)

strain = (displacement - length) / length;
stress = force / (pi * (diameter / 2)^2);

figure(id);
plot(strain, stress, 'Linewidth', 1);
grid;
grid minor;
xlabel 'Strain';
ylabel 'Stress in Pa';
set(gca, 'FontSize', 14);

end