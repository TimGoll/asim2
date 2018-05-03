function [f] = SMA_model_material_S(t, var)

global E_A E_M epsilon_T V_d tau_x T0 epsilon_A_T0 epsilon_M_T0 dsigma_dT
global k_b f_stress f_temperature

xpls = var(1);
xmns = var(2);
xaus = 1 - xpls - xmns;

%****** Inputs *********
sigma = f_stress(t);
temp = f_temperature(t);

%%**********************

% Compute model coefficients at temperature T

sigma_A_T0 = E_A*epsilon_A_T0;
sigma_M_T0 = E_M*(epsilon_M_T0 - epsilon_T);

sigma_A_T = sigma_A_T0 + dsigma_dT*(temp - T0);
sigma_M_T = sigma_M_T0 + dsigma_dT*(temp - T0);

epsilon_A_T = sigma_A_T/E_A;
epsilon_M_T = sigma_M_T/E_M + epsilon_T;

beta_T_old = 0.5*(E_M*(epsilon_T-epsilon_A_T)*(epsilon_T-epsilon_M_T)-E_A*epsilon_A_T*epsilon_M_T);

if sigma_A_T < 0  % Be sure that sigma_A is always positive
    sigma_A_T = 0;    
    sigma_M_T = sigma_A_T - (sigma_A_T0 - sigma_M_T0);
    epsilon_A_T = sigma_A_T/E_A;
    epsilon_M_T = sigma_M_T/E_M + epsilon_T;
    beta_T = 0.5*(E_M*(epsilon_T-epsilon_A_T)*(epsilon_T-epsilon_M_T)-E_A*epsilon_A_T*epsilon_M_T);
else
    beta_T = beta_T_old; 
end

% Compute strain values associated with each of energy well extremum:

a(1) = E_M/2;
a(2) = (E_M*(epsilon_T-epsilon_M_T)+E_A*epsilon_A_T)/2/(epsilon_A_T-epsilon_M_T);
a(3) = E_A/2;
a(4) = a(2);
a(5) = a(1);

b(1) = E_M*epsilon_T;
b(2) = epsilon_A_T*(E_M*(epsilon_T-epsilon_M_T)+E_A*epsilon_M_T)/(epsilon_A_T-epsilon_M_T);
b(3) = 0;
b(4) = -b(2);
b(5) = -E_M*epsilon_T;

c(1) = E_M/2*epsilon_T^2;
c(2) = (2*beta_T*(epsilon_A_T-epsilon_M_T)+epsilon_A_T^2*(E_M*(epsilon_T-epsilon_M_T)+E_A*epsilon_M_T))/2/(epsilon_A_T-epsilon_M_T);
c(3) = beta_T;
c(4) = c(2);
c(5) = c(1);

eps_ext = (sigma - b)./a/2;

if eps_ext(1) > -epsilon_M_T
    eps_ext(1)=-epsilon_M_T;
end
if eps_ext(2) < -epsilon_M_T
    eps_ext(2)=-epsilon_M_T;
elseif eps_ext(2) > -epsilon_A_T
    eps_ext(2)=-epsilon_A_T;
end

if eps_ext(3) < -epsilon_A_T
    eps_ext(3)=-epsilon_A_T;
elseif eps_ext(3) > epsilon_A_T
    eps_ext(3)=epsilon_A_T;
end

if eps_ext(4) < epsilon_A_T
    eps_ext(4)=epsilon_A_T;
elseif eps_ext(4) > epsilon_M_T
    eps_ext(4)=epsilon_M_T;
end

if eps_ext(5) < epsilon_M_T
    eps_ext(5)=epsilon_M_T;
end


G = a.*eps_ext.^2 + b.*eps_ext + c - sigma*eps_ext;


deltaG_mA = G(2)-G(1);
deltaG_Am = G(2)-G(3);
deltaG_Ap = G(4)-G(3);
deltaG_pA = G(4)-G(5);

lambda = V_d/k_b/temp;


pma = 1/tau_x*exp(-lambda*deltaG_mA);
pam = 1/tau_x*exp(-lambda*deltaG_Am);
ppa = 1/tau_x*exp(-lambda*deltaG_pA);
pap = 1/tau_x*exp(-lambda*deltaG_Ap);


% ------------------------------------------------------------------------
%
%	subroutine FCN	 --	RHS of ODE system
%
% ------------------------------------------------------------------------


f(1) = -xpls*ppa + xaus*pap;
f(2) = -xmns*pma + xaus*pam;

f = [f(1);f(2)];
