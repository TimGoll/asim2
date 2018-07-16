function sDE_dispIn(block)


setup(block);

% -------------------------------------------------------------------------
% Initialisierung des Simulationsobjektes block
% -------------------------------------------------------------------------

function setup(block)
  
  % Anzahl der Eingangs- und Ausgangsports
  block.NumInputPorts  = 2;
  block.NumOutputPorts = 10;
  
  % Anzahl der zeitkontinuierlichen Zustaende
  initConds = block.DialogPrm(2).Data;
  x1 = initConds.epsilon_v1;
  x2 = initConds.epsilon_v2;
  block.NumContStates = length(x1) + length(x2) + 2;

  % Anzahl der Parameter
  block.NumDialogPrms = 2;
  
  % Dimensionen der Eingangsports
  % Flag DirectFeedthrough kennzeichnet, ob ein Eingang direkt an einem
  % Ausgang auftritt, d.h. y=f(u)
  block.InputPort(1).Dimensions        = 1;
  block.InputPort(1).SamplingMode = 'Sample';
  block.InputPort(1).DirectFeedthrough = true;
  
  block.InputPort(2).Dimensions        = 1;
  block.InputPort(2).SamplingMode = 'Sample';
  block.InputPort(2).DirectFeedthrough = true;
  
  % Dimensionen der Ausgangsports  
  block.OutputPort(1).Dimensions       = 1;
  block.OutputPort(1).SamplingMode = 'Sample';
  
  block.OutputPort(2).Dimensions       = length(x1);
  block.OutputPort(2).SamplingMode = 'Sample';
  
  block.OutputPort(3).Dimensions       = length(x2);
  block.OutputPort(3).SamplingMode = 'Sample';
   
  block.OutputPort(4).Dimensions       = 1;
  block.OutputPort(4).SamplingMode = 'Sample';
  
  block.OutputPort(5).Dimensions       = 1;
  block.OutputPort(5).SamplingMode = 'Sample';
  
  block.OutputPort(6).Dimensions       = 1;
  block.OutputPort(6).SamplingMode = 'Sample';
  
  block.OutputPort(7).Dimensions       = 1;
  block.OutputPort(7).SamplingMode = 'Sample';
  
  block.OutputPort(8).Dimensions       = 1;
  block.OutputPort(8).SamplingMode = 'Sample';

  block.OutputPort(9).Dimensions       = 1;
  block.OutputPort(9).SamplingMode = 'Sample';
  
  block.OutputPort(10).Dimensions       = 1;
  block.OutputPort(10).SamplingMode = 'Sample';
  
  % Einstellen der Abtastzeit: [0 0] wird verwendet fuer die
  % zeitkontinuierliche Simulation.
  block.SampleTimes = [0 0];
  
  % ------------------------------------------------
  % NICHT VERAENDERN
  % ------------------------------------------------
  % 
  % Registrieren der einzelnen Methoden
  % Hier: InitializeConditions ... Initialisierung
  %       Outputs ...       Berechnung der Ausgaenge
  %       Derivatives ...   Berechnung der Zustaende
  %       Terminate ...     Konsistentes Beenden der Simulation
  block.RegBlockMethod('InitializeConditions',    @InitConditions); 
  block.RegBlockMethod('Outputs',                 @Output);  
  block.RegBlockMethod('Derivatives',             @Derivatives);  
  block.RegBlockMethod('Terminate',               @Terminate);

  % 
  
  
% -------------------------------------------------------------------------
% Setzen der Anfangsbedingungen der Zustaende
% -------------------------------------------------------------------------

function InitConditions(block)
  
  % Einlesen der Anfangsbedingungen
  initConds = block.DialogPrm(2).Data;

    
  % Eingabe der Anfangsbedingungen
  x = [initConds.epsilon_v1 initConds.epsilon_v2 initConds.epsilon2 initConds.q];
  
  % Schreiben auf Objekt block (NICHT VERAENDERN)
  block.ContStates.Data = x;


% -------------------------------------------------------------------------
% Berechnen der Ausgaenge
% -------------------------------------------------------------------------

function Output(block)

  % Einlesen der Parameter des Systems
 params = block.DialogPrm(1).Data;
  
  
    epsilon_0 = params.epsilon_0;
    epsilon_r = params.epsilon_r;
    Ci = params.Ci;
    beta = params.beta;
    kv1 = params.kv1;
    bv1 = params.bv1;
    kv2 = params.kv2;
    bv2 = params.bv2;
    bv20 = params.bv20;
    
    L1 = params.L1;
    L2 = params.L2;
    L3 = params.L3;
    
    rho = params.rho;
    Re_s = params.Re_s;
 
 
    % Shortcut for inputs
    y = block.InputPort(1).Data;
    v = block.InputPort(2).Data;
  
    % Shortcut for states
    epsilon_v1 = block.ContStates.Data(1:length(kv1));
    epsilon_v2 = block.ContStates.Data(length(kv1)+1:length(kv1)+length(kv2));
    epsilon2 = block.ContStates.Data(end-1);
    q = block.ContStates.Data(end);

    % Calculation of additional variables
        
    l1 = y;
    l2 = (1+epsilon2)*L2;
    l3 = L1*L2*L3/l1/l2;
    
    epsilon1 = (l1 - L1)/L1;
    epsilon3 = (l3 - L3)/L3;
    
    lambda1 = epsilon1 + 1;
    lambda2 = epsilon2 + 1;
    lambda3 = 1/lambda1/lambda2;
    
    C = epsilon_0*epsilon_r*l1*l2/l3;
    Rl = rho*l3/l1/l2;
    Re = Re_s/L1/L2;
        
    v_DE = q/C;
    E = v_DE/l3;
    
    % Calculation of outputs
    % Port 1  
    
    sigma1 = 0;
    for j = 1:length(Ci)
        sigma1 = sigma1 + j*Ci(j)*(lambda1^2 + lambda2^2 + lambda3^2 - 3)^(j-1)*(2*lambda1^2 - 2*lambda1^(-2)*lambda2^(-2));
    end
    sigma1 = sigma1 - epsilon_0*epsilon_r*(E^2);
    for j = 1:length(kv1)
       sigma1 = sigma1 - kv1(j)*epsilon_v1(j) + kv1(j)*epsilon1;
    end

  sigma1 = max(sigma1,0);
  y1 = sigma1*l2*l3;
  
  % Port 2:
  y2 = epsilon_v1;
  
  % Port 3:
  y3 = epsilon_v2;
  
  % Port 4:
  y4 = epsilon2;
  
  % Port 5:
  y5 = q;
  
  % Port 6:
  y6 = epsilon1;
  
  % Port 7:
  y7 = sigma1;
  
  % Port 8:
  y8 = -q/Re/C + v/Re;
  
  % Port 9:
  y9 = v_DE;
  
  % Port 10:
  y10 = C;

  % Schreiben auf Objekt block
  block.OutputPort(1).Data = y1;
  block.OutputPort(2).Data = y2;
  block.OutputPort(3).Data = y3;
  block.OutputPort(4).Data = y4;
  block.OutputPort(5).Data = y5;
  block.OutputPort(6).Data = y6;
  block.OutputPort(7).Data = y7;
  block.OutputPort(8).Data = y8;
  block.OutputPort(9).Data = y9;
  block.OutputPort(10).Data = y10;
  

% -------------------------------------------------------------------------
% Berechnen der Zustaende
% -------------------------------------------------------------------------

function Derivatives(block)

    % Einlesen der Parameter des Systems
    params = block.DialogPrm(1).Data;
 
    epsilon_0 = params.epsilon_0;
    epsilon_r = params.epsilon_r;
    Ci = params.Ci;
    beta = params.beta;
    kv1 = params.kv1;
    bv1 = params.bv1;
    kv2 = params.kv2;
    bv2 = params.bv2;
    bv20 = params.bv20;
    
    L1 = params.L1;
    L2 = params.L2;
    L3 = params.L3;
    
    rho = params.rho;
    Re_s = params.Re_s;
 
 
    % Shortcut for inputs
    y = block.InputPort(1).Data;
    v = block.InputPort(2).Data;
  
    % Shortcut for states
    epsilon_v1 = block.ContStates.Data(1:length(kv1));
    epsilon_v2 = block.ContStates.Data(length(kv1)+1:length(kv1)+length(kv2));
    epsilon2 = block.ContStates.Data(end-1);
    q = block.ContStates.Data(end);

    % Calculation of additional variables
        
    l1 = y;
    l2 = (1+epsilon2)*L2;
    l3 = L1*L2*L3/l1/l2;
    
    epsilon1 = (l1 - L1)/L1;
    epsilon3 = (l3 - L3)/L3;
    
    lambda1 = epsilon1 + 1;
    lambda2 = epsilon2 + 1;
    lambda3 = 1/lambda1/lambda2;
    
    C = epsilon_0*epsilon_r*l1*l2/l3;
    Rl = rho*l3/l1/l2;
    Re = Re_s/L1/L2;
        
    v_DE = q/C;
    E = v_DE/l3;
    
    % Calculation of states derivatives    
  
  dx = zeros(length(kv1) + length(kv2) + 2,1);
  for j = 1:length(kv1)
    dx(j) = -kv1(j)/bv1(j)*epsilon_v1(j) + kv1(j)/bv1(j)*epsilon1;
  end
  for j = length(kv1)+1:length(kv1)+length(kv2)
    h = j - length(kv1);
    dx(j) = -kv2(h)/bv2(h)*epsilon_v2(h) + kv2(h)/bv2(h)*epsilon2;
  end
  sigma2 = 0;
  for j = 1:length(Ci)
      sigma2 = sigma2 + j*Ci(j)*(lambda1^2 + lambda2^2 + lambda3^2 - 3)^(j-1)*(2*lambda2^2 - 2*lambda2^(-2)*lambda1^(-2));
  end
  sigma2 = sigma2 + 2*beta*lambda2*(lambda2 - 1);
  sigma2 = sigma2 - epsilon_0*epsilon_r*(E^2);
  for j = 1:length(epsilon_v2)
     sigma2 = sigma2 - kv2(j)*epsilon_v2(j) + kv2(j)*epsilon2; 
  end
  dx(end-1) = -1/bv20*sigma2;
  dx(end) = -q*(1/Re/C + 1/Rl/C) + v/Re;

  % Schreiben auf Objekt block
  block.Derivatives.Data = dx;


% -------------------------------------------------------------------------
% Operationen am Ende der Simulation
% -------------------------------------------------------------------------

% Die function Terminate wird hier nicht verwendet,
% muss aber vorhanden sein!
function Terminate(block)

