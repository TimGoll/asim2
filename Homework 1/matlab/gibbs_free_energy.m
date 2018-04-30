function [g] = gibbs_free_energy(epsilon, epsilon_A_T0, epsilon_M_T0, epsilon_T, sigma_A_T0, sigma_M_T0, dsigma_A__dT, T0, T, s)

g = helmholtz_free_energy(epsilon, epsilon_A_T0, epsilon_M_T0, epsilon_T, sigma_A_T0, sigma_M_T0, dsigma_A__dT, T0, T) ...
    - s * 10^9 * epsilon;

end