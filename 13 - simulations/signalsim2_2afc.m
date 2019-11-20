% signalsim2.m  Signal detection theory simulation:  2AFC task

clear
clc

% set decision variable parameters
mu1 = 0;
mu2 = 4;
sigma = 3;

% find d' from parameters
dprimecalc = ( mu2 - mu1 )/sigma

% initialize
T = 10000;        % number of trials
data = NaN(T,4);  % trial results

% run trials
for t = 1:T
    
    % *** part one:  get the decision variables
    
    % choose the signal
    signal = 1 + (rand<0.5);
    
    % get the decision variables
    % (use normrnd if you have the statistics toolbox)
    if signal==1
        dvar1 = mu1 + sigma*randn;
        dvar2 = mu2 + sigma*randn;
    else
        dvar1 = mu2 + sigma*randn;
        dvar2 = mu1 + sigma*randn;
    end
    
    % *** part two:  make a response
    
    % check decision variable
    response = 1 + (dvar1>dvar2);
    
    % record this trial
    data(t,:) = [ signal response dvar1 dvar2 ];
    
end

% find the proportion correct
pcorrect = mean( data(:,1) == data(:,2) );

% find d' from data
dprimehat = sqrt(2)*norminv(pcorrect)
