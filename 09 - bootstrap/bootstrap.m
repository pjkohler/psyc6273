%% bootstrap.m


%% part 1 -- bootstrapping (nonparametric)

% make some data
mu = 10;
sigma = 5;
nsamp = 100;
samp = normrnd(mu,sigma,[ nsamp 1 ]); % returns array of random numbers 
                                      % from a normal distribution with 
                                      % mean mu and std sigma

% find the mean and standard deviation of the data
muhat = mean(samp);
sigmahat = std(samp); % note: not identical to the population mean and std

% bootstrap the mean of the data
for b = 1:200
    
    % resample the data, with replacement
    % (this is the part that makes this version 'nonparametric')
    % sampboot = samp( unidrnd( nsamp, [ nsamp 1 ] ) );  % uses the statistics toolbox
    sampstar = samp( ceil( nsamp*rand([ nsamp 1 ]) ) );  % doesn't need the statistics toolbox
    
    % get the mean of the resampled data
    mustar(b) = mean(sampstar);
    
end

% find the bootstrapped standard error of the mean
stderrboot = std(mustar);
fprintf('bootstrapped standard error:  %.2f\n',stderrboot);

% compare this to the usual formula
stderrform = sigmahat/sqrt(nsamp);
fprintf('usual standard error:         %.2f\n',stderrform);

% compare this to the correct answer
stderr = sigma/sqrt(nsamp);
fprintf('true standard error:          %.2f\n',stderr);


%% part 2 -- bootstrapping (parametric)

% make some data
mu = 10;
sigma = 5;
nsamp = 100;
samp = mu + sigma*randn(nsamp,1);

% find the mean and standard deviation of the data
muhat = mean(samp);
sigmahat = std(samp);

% bootstrap the mean of the data
for b = 1:200
    
    % resample the data from the estimated distribution
    % (this is the part that makes this version 'parametric')
    sampstar = muhat + sigmahat*randn([ nsamp 1 ]);
    
    % get the mean of the resampled data
    mustar(b) = mean(sampstar);
    
end

% find the bootstrapped standard error of the mean
stderrboot = std(mustar);
fprintf('bootstrapped standard error:  %.2f\n',stderrboot);

% compare this to the usual formula
stderrform = sigmahat/sqrt(nsamp);
fprintf('usual standard error:         %.2f\n',stderrform);

% compare this to the correct answer
stderr = sigma/sqrt(nsamp);
fprintf('true standard error:          %.2f\n',stderr);


%% part 3 -- bootstrapping a psychometric function

% data to fit
stimlev =  [ 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 ];
ntrials =  [   20   20   20   20   20   20   20   20   20   20 ];
ncorrect = [   10   11   10   12   14   15   14   18   19   20 ];

% make the fitting function
% normcdf is the normal cumulative distribution function
fitfn = @( x, p ) 0.5 + 0.5*normcdf( x, p(1), p(2) );

% initialize list of bootstrapped thresholds
B = 200;
thresh = zeros(B+1,1);

% bootstrap
for t = 1:B+1

    % use original data on first run; then resample data
    if t==1
        ncorrectstar = ncorrect;
    else
        % draw a set of samples using the binomial distribution
        % binornd(n trials, probality of success on each trials): 
        ncorrectstar = binornd( ntrials, ncorrect./ntrials );
    end

    % use fminsearch to fit the psychometric function (see curvefit code):
    % binopdf (x, n, p) gives us the probability of having x successes
    % on n trials, when the probability of each success is p
    errfn = @(p) -sum( log( binopdf( ncorrectstar, ntrials, fitfn(stimlev,p) )));
    phat = fminsearch( errfn, [ 0.1 0.1 ]);
    thresh(t) = phat(1);

    % show results of fit
    clf;
    plot(stimlev,ncorrectstar./ntrials,'ro');
    hold on;
    fplot(@(x)fitfn(x,phat),[ 0 0.55 ]);
    axis([ 0 0.55 0 1.1 ]);
    xlabel 'stimulus contrast'
    ylabel 'proportion correct'
    drawnow;
    fprintf('threshold:  %.2f\n',thresh(t));

end

% report summary
fprintf('threshold:  %.2f +- %.2f\n',thresh(1),std(thresh(2:end)));

