% signalsim1.m  Signal detection theory simulation:  yes-no task

clear
clc

% set decision variable parameters
mu1 = 0;
mu2 = 4;
sigma = 3;

% find d' from parameters
dprimecalc = ( mu2 - mu1 )/sigma

% set the criterion
criterion = ( mu1 + mu2 )/2;

% initialize
T = 10000;        % number of trials
data = NaN(T,3);  % trial results

% run trials
for t = 1:T
    
    % *** part one:  get the decision variable
    
    % choose the signal
    signal = 1 + (rand<0.5);
    
    % get the decision variable
    % (use normrnd if you have the statistics toolbox)
    if signal == 1
        dvar = mu1 + sigma*randn;
    else
        dvar = mu2 + sigma*randn;
    end
    
    % *** part two:  make a response
    
    % check decision variable
    if dvar > criterion
        response = 2;
    else
        response = 1;
    end
    % or, in one line:  response = 1 + (dvar>criterion);
    
    % record this trial
    data(t,:) = [ signal response dvar ];
    
end

% find the hit rate
i2 = data(:,1) == 2;
r2 = data(i2,2);
hitrate = mean( r2 == 2 );
% or, in one line:  hitrate = mean( data( data(:,1)==2, 2 )==2 );

% find the false alarm rate
i1 = data(:,1) == 1;
r1 = data(i1,2);
farate = mean( r1 == 2 );
% or, in one line:  farate = mean( data( data(:,1)==1, 2 )==2 );

% find d' from data
z = @( x ) norminv(x,0,1);
dprimehat = z( hitrate ) - z( farate )

% show decision variable distributions
[n1,x1] = hist( data(i1,3) );
[n2,x2] = hist( data(i2,3) );
plot(x1,n1,'ro-',x2,n2,'go-');
set(gca,'FontSize',18,'FontWeight','bold');
xlabel 'decision variable'
ylabel 'frequency'

% show criterion
hold on
plot([ criterion criterion ],get(gca,'YLim'),'k:');
hold off
