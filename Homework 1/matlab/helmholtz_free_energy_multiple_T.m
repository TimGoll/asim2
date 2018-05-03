function [] = helmholtz_free_energy_multiple_T (epsilon, epsilon_A_T0, epsilon_M_T0, epsilon_T, sigma_A_T0, sigma_M_T0, dsigma_A__dT, T0, T1, T2, T3, T4)

psi0 = helmholtz_free_energy(epsilon, epsilon_A_T0, epsilon_M_T0, epsilon_T, sigma_A_T0, sigma_M_T0, dsigma_A__dT, T0, T0);
psi1 = helmholtz_free_energy(epsilon, epsilon_A_T0, epsilon_M_T0, epsilon_T, sigma_A_T0, sigma_M_T0, dsigma_A__dT, T0, T1);
psi2 = helmholtz_free_energy(epsilon, epsilon_A_T0, epsilon_M_T0, epsilon_T, sigma_A_T0, sigma_M_T0, dsigma_A__dT, T0, T2);
psi3 = helmholtz_free_energy(epsilon, epsilon_A_T0, epsilon_M_T0, epsilon_T, sigma_A_T0, sigma_M_T0, dsigma_A__dT, T0, T3);
psi4 = helmholtz_free_energy(epsilon, epsilon_A_T0, epsilon_M_T0, epsilon_T, sigma_A_T0, sigma_M_T0, dsigma_A__dT, T0, T4);

figure('Name', 'Helmholtz Free Energy at multiple Temperatures [T0=' + string(T0) + 'K]');
plot(epsilon, psi0, 'Linewidth', 1); hold on;
plot(epsilon, psi1, 'Linewidth', 1);
plot(epsilon, psi2, 'Linewidth', 1);
plot(epsilon, psi3, 'Linewidth', 1); 
plot(epsilon, psi4, 'Linewidth', 1);
legend(string(T0)+'K', string(T1)+'K', string(T2)+'K', string(T3)+'K', string(T4)+'K', 'Location', 'southeast');
grid;
grid minor;
xlabel 'Strain [%]';
ylabel 'Helmholtz Free Energy at multiple Temperatures [T0=' + string(T0) + 'K] [GPa]';
set(gca, 'FontSize', 14);

end