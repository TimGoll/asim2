% parameter list


params = struct;		% system parameters

params.L3 = 40e-6;             %	DE membrane 3-length, thickness		[m]
params.epsilon_0 = 8.854e-12;  % 	Void permittivity			[F/m]
%params.epsilon_r = 3;		   %	DE relative permittivity
params.epsilon_r = 4;		   %	DE relative permittivity
%params.C1 = 1e5;               %	DE Neo Hookean model coefficient [Pa]
params.C1 = 2.7e5;               %	DE Neo Hookean model coefficient [Pa]
params.kv = 1e5;               % 	DE viscoelastic model stiffness	[Pa]
params.bv = 1e5;               %    DE viscoelastic model damping [Pa*s]



initConds = struct;		% initial conditions
initConds.epsilon_v 		= 0*ones(size(params.kv));                	% 	Initial viscoelastic strain




