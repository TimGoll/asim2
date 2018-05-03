function [] = gibbs_free_energy_multiple_loads(epsilon, epsilon_A_T0, epsilon_M_T0, epsilon_T, sigma_A_T0, sigma_M_T0, dsigma_A__dT, T0, T, s1, s2, s3)

g1 = gibbs_free_energy(epsilon, epsilon_A_T0, epsilon_M_T0, epsilon_T, sigma_A_T0, sigma_M_T0, dsigma_A__dT, T0, T, s1)*(10^-7);
g2 = gibbs_free_energy(epsilon, epsilon_A_T0, epsilon_M_T0, epsilon_T, sigma_A_T0, sigma_M_T0, dsigma_A__dT, T0, T, s2)*(10^-7);
g3 = gibbs_free_energy(epsilon, epsilon_A_T0, epsilon_M_T0, epsilon_T, sigma_A_T0, sigma_M_T0, dsigma_A__dT, T0, T, s3)*(10^-7);

figure('Name', 'Gibbs Free Energy at multiple loads [T0=T=' + string(T0) + 'K]');
plot(epsilon, g1, 'Linewidth', 1); hold on;
plot(epsilon, g2, 'Linewidth', 1);
plot(epsilon, g3, 'Linewidth', 1);
legend(string(s1)+'GPa', string(s2)+'GPa', string(s3)+'GPa', 'Location', 'southwest');
grid;
grid minor;
xlabel 'Strain [%]';
ylabel 'Gibbs Free Energy [GPa]';
set(gca, 'FontSize', 14);

end