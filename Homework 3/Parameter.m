%% SMA Parameters

params = struct;

params.E_A 			= 70.0e9;				%	Austenite modulus of elasticity		[Pa]
params.E_M			= 30.0e9;				%	Martensite modulus of elasticity	[Pa]
params.epsilon_T 	= 0.04;					%	epsilon_T			[-]
params.epsilon_A_T0 = 0.0035;	            %   epsilon_A at temperature T0 [-]
params.epsilon_M_T0 = 0.0415;	            %   epsilon_M at temperature T0 [-]
params.T0 			= 293;	             	%	reference temperature at which epsilon_A_T0 and epsilon_M_T0 are measured  [K]
params.dsigma_dT 	= 7e6;                  %   dsigma/dtemp [Pa]

params.V_d 			= 5e-23;           		% 	volume of a layer					[m^3]
params.tau_x 		= 1e-2;					%	vibration frequency	[s]
params.k_b 			= 1.380649e-23;	   	 	%	Boltzman constant					[J/K]

params.alpha 		= 210;					%	convection coefficient				[W/(m^2*K)]
params.c_v 			= 0.45e3;				%	Heat capacity						[J/(kg*K)]
params.rho 			= 6500;					%	density								[kg/m^3]
params.latentHpls 	= 24e3*params.rho;		% 	Latent heat of phase transformation 	[J/m^3]
params.latentHmns 	= 24e3*params.rho;		% 	Latent heat of phase transformation 	[J/m^3]

params.r0 			= 38e-6;				%	wire radius							[m]
params.L0 			= 0.1;					%	wire length							[m]

params.T0R          = 293;                  %   reference temperature for computing R	[K]
params.rho0A        = 8.9e-7;               %   resistivity of austenite            [Ohm*m]
params.rho0Mp       = 10.2e-7;              %   resistivity of martensite plus   	[Ojm*m]
params.rho0Mm       = 10.2e-7;              %   resistivity of martensite minus     [Ojm*m]
params.alphaA       = 2e-4;                 %   temperature dependence of austenite [1/K]
params.alphaMp      = 3e-4;                 %   temperature dependence of austenite [1/K]
params.alphaMm      = 3e-4;                 %   temperature dependence of austenite [1/K]
params.poisson      = 0.3;                  %   Poisson's ratio                     [-]

%% Initial conditions

initConds = struct;

initConds.xp0 		= 1.0;                	% 	Initial phase fraction x+   [-]
initConds.xm0 		= 0.0;                	%	Initial phase fraction x-   [-]
initConds.T0 		= 293;                  % 	Initial temperature of wire [K]

%% Bias parameters - mass

bias.m = 0.2;                               %   Bias mass [kg]
bias.g = 9.81;                              %   Gravitational acceleration [m/s^2]
bias.y0 = 0.1054;                           %   Initial condition for SMA length in case of bias mass [m]
bias.v0 = 0;                                %   Initial condition for SMA velocity in case of bias mass [m/s]             

%%Bias parameters - spring

spring.k = 325.61;
spring.y0 = 0.1088;