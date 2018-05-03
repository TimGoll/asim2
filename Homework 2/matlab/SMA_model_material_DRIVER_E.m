
clear;
% close all;
global E_A E_M epsilon_T V_d tau_x T0 epsilon_A_T0 epsilon_M_T0 dsigma_dT
global k_b f_strain f_temperature


% ---------------------------------------------------------------------
%
% input information
%
% ---------------------------------------------------------------------

E_A = 70.0e9;			%	Austenite modulus of elasticity		[Pa]
E_M = 30.0e9;			%	Martensite modulus of elasticity	[Pa]
epsilon_T = 0.045;		%	epsilon_T			[-]
epsilon_A_T0 = 0.006;   %   epsilon_A at temperature T0 [-]
epsilon_M_T0 = 0.05;    %   epsilon_A at temperature T0 [-]
dsigma_dT = 7e6;        %   dsigma/dtemp [Pa]
T0 = 323;               %	reference temperature at which epsilon_A_T0 and epsilon_M_T0 are measured  [K]
V_d = 1e-23;            % 	volume of a layer	[m^3]
tau_x = 1e-2;			%	vibration frequency	[1/s]
k_b = 1.38044e-23;	    %	Boltzman constant
  
f_strain = @(t) 0.07*sin(2*pi/10*t);    %   Strain function over time t [-]
f_temperature = @(t) 333;                       %   Temperature function over time t [K]

tspan=[0,30];
y_initial=[0,0];

options = odeset('RelTol',1e-6,'AbsTol',1e-6);


% initialize cputime measurement for ODE solver
tt=cputime;


[t,y] = ode15s('SMA_model_material_E',tspan,y_initial,options);

% elapsed cputime
e = cputime - tt

strain = t*0;
temp = t*0;

for i = 1:length(t)
    strain(i) = f_strain(t(i));
    temp(i) = f_temperature(t(i));
end

if length(strain) == 1
    strain = strain*ones(size(t));
end
if length(temp) == 1
    temp = f_temperature*ones(size(t));
end

%%%%% Stress value %%%%%%%%

xpls = y(:,1);
xmns = y(:,2);
xaus = 1-xpls-xmns;

stress = E_M*(strain - xpls.*epsilon_T + xmns.*epsilon_T) ./ ( xpls + xmns + (E_M/E_A)*(xaus) );

%***********************%%%%%%%%%%




subplot(2,3,1),plot(t,strain,'LineWidth',2);
set(gca,'FontSize',14,'Fontname','Arial');
xlabel('Time [s]','FontName','Arial','FontSize',14);
ylabel('Strain [-]','FontName','Arial','FontSize',14);
xlim([min(t) max(t)]);
grid on

subplot(2,3,2),plot(t,xpls,t,xmns,t,xaus,'LineWidth',2);
set(gca,'FontSize',14,'Fontname','Arial');
xlabel('Time [s]','FontName','Arial','FontSize',14);
ylabel('Phase Fractions [-]','FontName','Arial','FontSize',14);
xlim([min(t) max(t)]);
ylim([-0.2 1.2]);
grid on
legend('x_+','x_-','x_A','Location','NE');

subplot(2,3,3),plot(t,temp,'LineWidth',2);
set(gca,'FontSize',14,'Fontname','Arial');
xlabel('Time [s]','FontName','Arial','FontSize',14);
ylabel('Temperature [K]','FontName','Arial','FontSize',14);
xlim([min(t) max(t)]);
grid on

subplot(2,3,4),plot(t,stress*10^-9,'LineWidth',2);
set(gca,'FontSize',14,'Fontname','Arial');
xlabel('Time [s]','FontName','Arial','FontSize',14);
ylabel('Stress [GPa]','FontName','Arial','FontSize',14);
xlim([min(t) max(t)]);
grid on

subplot(2,3,5),plot(strain,stress*10^-9,'LineWidth',2);
set(gca,'FontSize',14,'Fontname','Arial');
xlabel('Strain [-]','FontName','Arial','FontSize',14);
ylabel('Stress [GPa]','FontName','Arial','FontSize',14);
grid on

subplot(2,3,6),plot(temp,strain,'LineWidth',2);
set(gca,'FontSize',14,'Fontname','Arial');
xlabel('Temperature [K]','FontName','Arial','FontSize',14);
ylabel('Strain [-]','FontName','Arial','FontSize',14);
grid on