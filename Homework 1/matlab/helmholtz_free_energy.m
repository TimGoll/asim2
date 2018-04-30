function [psi] = helmholtz_free_energy (epsilon, epsilon_A_T0, epsilon_M_T0, epsilon_T, sigma_A_T0, sigma_M_T0, dsigma_A__dT, T0, T)

%%% Calculate temperature dependent parameters

E_A = sigma_A_T0 / epsilon_A_T0; % [GPa], Young modulus of austenitic phase E_A
E_M = sigma_M_T0 / (epsilon_M_T0 - epsilon_T); % [GPa], Young modulus of martensitic phase E_M

delta_sigma = sigma_A_T0 - sigma_M_T0; % [GPa]

sigma_A = sigma_A_T0 + dsigma_A__dT*(T - T0);
sigma_M = sigma_A - delta_sigma;

epsilon_A = sigma_A/E_A;
epsilon_M = sigma_M/E_M + epsilon_T;

beta_T_old = 0.5*(E_M*(epsilon_T - epsilon_A)*(epsilon_T - epsilon_M) - E_A*epsilon_A*epsilon_M); % [GP]

if sigma_A < 0  % Be sure that sigma_A is always positive
    sigma_A = 0;
    
    sigma_M = sigma_A - delta_sigma;

    epsilon_A = sigma_A/E_A;
    epsilon_M = sigma_M/E_M + epsilon_T;

    beta_T = 0.5*(E_M*(epsilon_T - epsilon_A)*(epsilon_T - epsilon_M) - E_A*epsilon_A*epsilon_M); % [GP]
else
    beta_T = beta_T_old; 
end


%%% Set arrays

psi = epsilon*0;
psi1 = epsilon*0;
psi2 = epsilon*0;
psi3 = epsilon*0;
psi4 = epsilon*0;
psi5 = epsilon*0;
sigma = epsilon*0;
E = epsilon*0;

%%% Calculate parabola coefficients

a1 = 0.5*E_M;
b1 = E_M*epsilon_T;
c1 = 0.5*E_M*epsilon_T*epsilon_T;
a2 = (E_M*(epsilon_T-epsilon_M)+E_A*epsilon_A)/(2*(epsilon_A-epsilon_M));
b2 = epsilon_A*(E_M*(epsilon_T-epsilon_M) + E_A*epsilon_M)/(epsilon_A-epsilon_M);
c2 = (2*beta_T*(epsilon_A - epsilon_M) + epsilon_A^2*(E_M*(epsilon_T-epsilon_M) + E_A*epsilon_M))/(2*(epsilon_A - epsilon_M));
a3 = 0.5*E_A;
b3 = 0;
c3 = beta_T;
a4 = (E_M*(epsilon_T-epsilon_M)+E_A*epsilon_A)/(2*(epsilon_A-epsilon_M));
b4 = -epsilon_A*(E_M*(epsilon_T-epsilon_M) + E_A*epsilon_M)/(epsilon_A-epsilon_M);
c4 = (2*beta_T*(epsilon_A - epsilon_M) + epsilon_A^2*(E_M*(epsilon_T-epsilon_M) + E_A*epsilon_M))/(2*(epsilon_A - epsilon_M));
a5 = 0.5*E_M;
b5 = -E_M*epsilon_T;
c5 = 0.5*E_M*epsilon_T*epsilon_T;


%%% Calculate curves

for i = 1:length(epsilon)

   if epsilon(i) <= -epsilon_M
      psi(i) = a1*epsilon(i)^2 + b1*epsilon(i) + c1;
      sigma(i) = 2*a1*epsilon(i) + b1;
      E(i) = 2*a1;
   end
   if epsilon_A > 0
       if -epsilon_M < epsilon(i) && epsilon(i) < -epsilon_A
          psi(i) = a2*epsilon(i)^2 + b2*epsilon(i) + c2;
          sigma(i) = 2*a2*epsilon(i) + b2;
          E(i) = 2*a2;
       end
       if -epsilon_A <= epsilon(i) && epsilon(i) <= epsilon_A
          psi(i) = a3*epsilon(i)^2 + b3*epsilon(i) + c3;
          sigma(i) = 2*a3*epsilon(i) + b3;
          E(i) = 2*a3;
       end

       if epsilon_A < epsilon(i) && epsilon(i) < epsilon_M
          psi(i) = a4*epsilon(i)^2 + b4*epsilon(i) + c4;
          sigma(i) = 2*a4*epsilon(i) + b4;
          E(i) = 2*a4;
       end
   else
       if -epsilon_M < epsilon(i) && epsilon(i) <= 0
          psi(i) = a2*epsilon(i)^2 + b2*epsilon(i) + c2;
          sigma(i) = 2*a2*epsilon(i) + b2;
          E(i) = 2*a2;
       end 
       if 0 < epsilon(i) && epsilon(i) < epsilon_M
          psi(i) = a4*epsilon(i)^2 + b4*epsilon(i) + c4;
          sigma(i) = 2*a4*epsilon(i) + b4;
          E(i) = 2*a4;
       end 
   end
   if epsilon(i) >= epsilon_M
      psi(i) = a5*epsilon(i)^2 + b5*epsilon(i) + c5;
      sigma(i) = 2*a5*epsilon(i) + b5;
      E(i) = 2*a5;
   end
   
   psi1(i) = a1*epsilon(i)^2 + b1*epsilon(i) + c1;
   psi2(i) = a2*epsilon(i)^2 + b2*epsilon(i) + c2;
   if epsilon_A > 0
       psi3(i) = a3*epsilon(i)^2 + b3*epsilon(i) + c3;
   else
       psi3(i) = a3*epsilon(i)^2 + b3*epsilon(i) + beta_T_old;    
   end
   psi4(i) = a4*epsilon(i)^2 + b4*epsilon(i) + c4;
   psi5(i) = a5*epsilon(i)^2 + b5*epsilon(i) + c5;
   
end

end