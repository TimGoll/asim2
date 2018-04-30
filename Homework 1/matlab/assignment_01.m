fileID       = fopen('SMADisplacementForceData__l0_142mm__d_76um__T_373K');
dataArray    = textscan(fileID,'%f %f');
fclose(fileID);
 
% import data
displacement = dataArray{:,1};
force        = dataArray{:,2};

% variables
length       = 0.142;
diameter     = 76*10^(-6);

[strain, stress] = strain_stress(1, displacement, force, length, diameter);
                   single_crystal(2, strain, stress);