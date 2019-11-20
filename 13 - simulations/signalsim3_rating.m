% signalsim3.m  Signal detection theory simulation:  rating task

clear
clc

% set decision variable parameters
mu1 = 0;
mu2 = 4;
sigma = 3;

% find d' from parameters
dprimecalc = ( mu2 - mu1 )/sigma;

% set the criteria
criteria = [ -Inf linspace(mu1-sigma,mu2+sigma,5) Inf ];

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
    
    % find the first criterion that is greater than the decision variable
    for i = 2:numel(criteria)
        if criteria(i)>dvar
            response = i-1;
            break
        end
    end
    % or, in one line:  response = find( criteria > dvar, 1 ) - 1;
    
    % record this trial
    data(t,:) = [ signal response dvar ];
    
end

% get the list of responses the observer used
resplist = unique(data(:,2));

% step through responses
for i = 1:numel(resplist)-1
    
    % find the hit and false alarm rates
    hitrate(i) = mean( data( data(:,1)==2, 2 )>resplist(i) );
    farate(i) =  mean( data( data(:,1)==1, 2 )>resplist(i) );
    
    % find d' from this response criterion
    dprime(i) = norminv(hitrate(i)) - norminv(farate(i));
    
end

% plot an roc curve
figure(1); clf;
plot(farate,hitrate,'ro-');
set(gca,'FontSize',18,'FontWeight','bold');
xlabel 'false alarm rate'
ylabel 'hit rate'
axis square

% show d's calculated from data
figure(2); clf;
plot(resplist(1:end-1),dprime,'go-');
hold on
plot(get(gca,'XLim'),[ dprimecalc dprimecalc ],'k:');
hold off
set(gca,'YLim',[ 0 1.5 ]);
set(gca,'FontSize',18,'FontWeight','bold');
xlabel response
ylabel 'd'''
