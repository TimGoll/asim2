function [] = helmholtz_free_energy_fixed_T (epsilon, epsilon_A_T0, epsilon_M_T0, epsilon_T, sigma_A_T0, sigma_M_T0, dsigma_A__dT, T0, T)

psi = helmholtz_free_energy(epsilon, epsilon_A_T0, epsilon_M_T0, epsilon_T, sigma_A_T0, sigma_M_T0, dsigma_A__dT, T0, T);

figure('Name', 'Helmholtz Free Energy at ' + string(T) + 'K [T0=' + string(T0) + 'K]');
plot(epsilon, psi, 'Linewidth', 1);
grid;
grid minor;
xlabel 'Strain [%]';
ylabel 'Helmholtz Free Energy [GPa]';
set(gca, 'FontSize', 14);

end