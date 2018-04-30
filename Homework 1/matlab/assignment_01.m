fileID       = fopen('SMADisplacementForceData__l0_142mm__d_76um__T_373K');
dataArray    = textscan(fileID,'%f %f');
fclose(fileID);
 
% import data
displacement = dataArray{:,1};
force        = dataArray{:,2};

% variables
length       = 0.142;
diameter     = 76*10^(-6);

[strain, stress]                      = strain_stress(displacement, force, length, diameter);
[e_A_T0, e_M_T0, e_T, s_A_T0, s_M_T0] = single_crystal(strain, stress);
                                        helmholtz_free_energy_fixed_T(strain, e_A_T0, e_M_T0, e_T, s_A_T0, s_M_T0, 7, 373, 373);
                                        helmholtz_free_energy_multiple_T(strain, e_A_T0, e_M_T0, e_T, s_A_T0, s_M_T0, 7, 373, 372.975, 372.95, 372.925, 372.9);
                                        gibbs_free_energy_multiple_loads(strain, e_A_T0, e_M_T0, e_T, s_A_T0, s_M_T0, 7, 373, 373, 0.05, 0.2, 0.35);