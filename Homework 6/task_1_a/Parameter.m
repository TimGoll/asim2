% parameter list


params = struct;		% system parameters

params.L1 = 5e-2;              %	DE membrane 1-length		[m]
params.L2 = 5e-1;              %	DE membrane 2-length		[m]
params.L3 = 50e-6;             %	DE membrane 3-length		[m]
params.epsilon_0 = 8.854e-12;  % 	Void permittivity			[F/m]
params.epsilon_r = 3;		   %	DE relative permittivity
params.alpha = [1 1.5 2];               %	DE Ogden model exponents [-]
params.mu = [774 -885 277]*1e6;         %	DE Ogden model coefficient [Pa]
params.kv = [0.59 0.18 6.32]*1e6;            % 	DE viscoelastic model stiffness	[Pa]
params.bv = [0.08 0.25 0.00632]*1e6;            %   DE viscoelastic model damping [Pa*s]
params.rho = 1e12;                      %	DE resistivity [Ohm*m]
params.Re_s = 50;                       %	Electrodes resistance scaling coefficient [Ohm*m^2]

initConds = struct;		% initial conditions
initConds.epsilon           = 1.24;                                              % 	Initial strain, only used to compute initial viscoelastic strains [-]
initConds.epsilon_v 		= initConds.epsilon*ones(size(params.kv));        % 	Initial viscoelastic strain [-]
initConds.q                 = 0;                                              % 	Initial charge [C]

