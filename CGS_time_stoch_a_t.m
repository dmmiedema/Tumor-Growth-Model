%% Clone Growth Simulation, with time dependence in the event probabilities (CGS_time), of malignant cells in a tumor. 
% Dani�l M. Miedema - Vermeulen Lab - Academic Medical Center - Amsterdam - The Netherlands.
% May 9th, 2018. 

%% NOTE: This is a version of CGS with a time dependent and stochastich a(t) for a surface mode of growth. In this version the stochastic term is varies over space and time.

%% Description
% The program in this script can be used for simulating growth of malignant cells. 
% Each clone starts as a single cell and grows according to the following dynamics.
% Cells divide or lose clonenigic activity (i.e. stop growing) with rate lambda and probabilities a and 1-a, respectively. 
% Clonogenic activity is lost for the whole clone simultaneously or for individual cells; 
% the probability that a cell loses clonogenic activity through either of these processes is h and 1-h, respectively.

%% Input
% lambda (>0)   -   Cell division rate (1/day)
% h (0-1)       -   Heterogeneity parameter. With average probability 1-a clonogenicity is lost during time-interval lambda*dt. 
%                   h determines whether loss of clonogenicity occurs for all cells in a clone simultaneously, or for single cells (probability 1-h).

%% Parameters
% Nclones       -   Number of clones to simulate
% tmax          -   Maximum time of simulations (days)

%% Ouptut 
% CloneSizes    -   Array of clone sizes for each clone (row) and day (column).

%% Main Function
function CloneSizes=CGS_time_stoch_a_t(lambda,h)    
    Nclones=10^6;                                                           % Number of clones to be simulated.
    tmax=42;                                                                % Maximum time (days) in simulation.   
    CloneSizes=zeros(Nclones,tmax);                                         % Initialize: array of clone sizes.
    a_noise_std=0.05;                                                       % Standard deviation of normally distributed noise in a parameter
    for i=1:Nclones                                                         % Simulate clone growth for Nclones.
        nc=1;                                                               % Initialize: number of clonogenic cells in clone.
        nnc=0;                                                              % Initialize: number of non-clonogenic cells in clone.
        t=0;                                                                % Initialize: continuous time variable.
        day=1;                                                              % Initialize: discrete time variable for saving clone sizes every simulated day. 
        while t<tmax                                                        % Simulate clone growth until tmax.
            if nc>0                                                         % If number of clonogenic cells in clone is larger than zero: continue simulation.
                dt=-log(rand)/(nc*lambda);                                  % Time increment until next event.
                t=t+dt;                                                     % Update time variable.
                a_delta=normrnd(0,a_noise_std);                             % Stochastic noise term of a(t)
                a=(1+2/(lambda*t+10))/2+a_delta;                            % Update probability of cell division.
                if a<0, a=0; end                                            % Minimum value of a (a probability) is zero
                if a>1, a=1; end                                            % Maximum value of a (a probability) is one
                while t-day>=0 && day<=tmax                                 % Store clone size at (integer) day values in interval dt.
                    CloneSizes(i,day)=nc+nnc;
                    day=day+1;
                end                        
                p1=rand;                                                    % Generate random number to randomly choose the next event.
                if p1<a                                                     % Next event: cell division.
                    nc=nc+1;
                elseif p1>=a && p1<a+(1-a)*(1-h)                            % Next event: single cell loses clonegenicity.
                    nc=nc-1;
                    nnc=nnc+1;
                elseif p1>=a+(1-a)*(1-h) && p1<a+(1-a)*(1-h)+(1-a)*h/nc     % Next event: all clonogenic cells in clone lose clonogenicity.
                    nnc=nc+nnc;
                    nc=0;
                end
            else                                                            % If number of clonogenic cells in clone is zero: growth stops. Save clone size for all remaining days until tmax. 
                CloneSizes(i,day:end)=nc+nnc;
                t=tmax;
            end
        end
    end
end