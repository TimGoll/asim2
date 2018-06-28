function sDE_epsIn(block)


setup(block);

% -------------------------------------------------------------------------
% Initialisierung des Simulationsobjektes block
% -------------------------------------------------------------------------

function setup(block)
  
  % Anzahl der Eingangs- und Ausgangsports
  block.NumInputPorts  = 2;
  block.NumOutputPorts = 2;
  
  % Anzahl der zeitkontinuierlichen Zustaende
  initConds = block.DialogPrm(2).Data;
  x = initConds.epsilon_v;
  block.NumContStates = length(x);

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
  
  block.OutputPort(2).Dimensions       = length(x);
  block.OutputPort(2).SamplingMode = 'Sample';

  
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
  x = initConds.epsilon_v;
  
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
    C1 = params.C1;
    kv = params.kv;
 
 
 
  % Shortcut fuer den Eingang
  epsilon = block.InputPort(1).Data;
  E = block.InputPort(2).Data;

  
  % Shortcut fuer den Zustand
  epsilon_v = block.ContStates.Data;

  % Berechnung der Ausgaenge
  % Port 1:

  
    lambda = epsilon + 1;
    Sigma_m = 2*C1*(lambda^2-lambda^-2);
    Sigma_e = - epsilon_0*epsilon_r*(E)^2;
    Sigma_v = 0;
    for j = 1:length(kv)
       Sigma_v = Sigma_v - kv(j)*epsilon_v(j) + kv(j)*epsilon;
    end

  y1 = Sigma_m + Sigma_e + Sigma_v;
  
  % Port 2:
  y2 = epsilon_v;


  % Schreiben auf Objekt block
  block.OutputPort(1).Data = y1;
  block.OutputPort(2).Data = y2;
  

% -------------------------------------------------------------------------
% Berechnen der Zustaende
% -------------------------------------------------------------------------

function Derivatives(block)

    % Einlesen der Parameter des Systems
    params = block.DialogPrm(1).Data;
 
    kv = params.kv;
    bv = params.bv;
 
 
  
  % Shortcut fuer den Eingang
  epsilon = block.InputPort(1).Data;
  
  % Shortcut fuer die Zustaende
  epsilon_v = block.ContStates.Data;
  
  dx = zeros(size(kv));
  for j = 1:length(dx)
    dx(j) = -kv(j)/bv(j)*epsilon_v(j) + kv(j)/bv(j)*epsilon;
  end

  % Schreiben auf Objekt block
  block.Derivatives.Data = dx;


% -------------------------------------------------------------------------
% Operationen am Ende der Simulation
% -------------------------------------------------------------------------

% Die function Terminate wird hier nicht verwendet,
% muss aber vorhanden sein!
function Terminate(block)

