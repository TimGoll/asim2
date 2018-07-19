% parameter list


params = struct;		% system parameters

params.L1 = 0.01;              %	DE membrane 1-length		[m]
params.L2 = 0.2;               %	DE membrane 2-length		[m]
params.L3 = 50e-6;             %	DE membrane 3-length		[m]
params.epsilon_0 = 8.854e-12;  % 	Void permittivity			[F/m]
params.epsilon_r = 3;		   %	DE relative permittivity
params.Ci = [0.17307 -0.01853 0.008096]*1e6;         %	DE Yeoh model coefficient [Pa]
params.kv1 = [0.2950 0.0900 3.1600]*1e6;            % 	DE viscoelastic model stiffness 1	[Pa]
params.bv1 = [0.0400 0.1250 0.0032]*1e6;            %   DE viscoelastic model damping 1 [Pa*s]
params.kv2 = [0.2950 0.0900]*1e4;            % 	DE viscoelastic model stiffness 2	[Pa]
params.bv2 = [0.0400 0.1250]*1e4;            %   DE viscoelastic model damping 2 [Pa*s]
params.bv20 = 0.0032*1e4;
params.rho = 1e12;                      %	DE resistivity [Ohm*m]
params.Re_s = 50;                       %	Electrodes resistance scaling coefficient [Ohm*m^2]

LUTx = [0 0.0400 0.2000 0.4000 1.0000 3.0000 5.0000 10.0000 20];
LUTy = [0 0.0148 0.0769 0.1429 0.3333 0.7273 0.8421 0.9302 0.99];

if params.L2/params.L1 < 0
    eta = 0;
elseif params.L2/params.L1 > 20
    eta = 0.99;   
else
    eta = interp1(LUTx,LUTy,params.L2/params.L1,'pchip','extrap'); 
end
params.beta = 3*params.Ci(1)*eta/(1 - eta);

initConds = struct;		% initial conditions
initConds.epsilon1           	= 0;                                              % 	Initial strain 1, only used to compute initial viscoelastic strains [-]
initConds.epsilon_v1 		= initConds.epsilon1*ones(size(params.kv1));       % 	Initial viscoelastic strain 1 [-]
initConds.epsilon_v2 		= 0*ones(size(params.kv2));       % 	Initial viscoelastic strain 2 [-]
initConds.epsilon2          = 0;                              % 	Initial epsilon 2 [-]
initConds.q                 = 0;                              % 	Initial charge [C]

