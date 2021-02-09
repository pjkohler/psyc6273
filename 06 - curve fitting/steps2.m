% maximum likelihood fit of a curve to a psychometric function, in steps

% here's our data
stimlev =  [ 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 ];
ntrials =  [   20   20   20   20   20   20   20   20   20   20 ];
ncorrect = [   10   11   10   12   14   15   14   18   19   20 ];

% here's the function we're going to fit to the data
fitfn = @( x, mu, sigma ) 0.5 + 0.5*normcdf( x, mu, sigma );

% here's a guess for mu and sigma
mu = 0.10;
sigma = 0.20;

% what's the probability of a correct response at the lowest stimulus
% level, according to these values of mu and sigma?
fitfn( stimlev(1), mu, sigma )

% what's the probability of getting the observed number of correct
% responses at the lowest stimulus level, according to these values
% of mu and sigma?
binopdf( ncorrect(1), ntrials(1), fitfn( stimlev(1), mu, sigma ) )

% what are the probabilities of correct responses at *all* the stimulus
% levels, according to these values of mu and sigma?
fitfn( stimlev, mu, sigma )

% what are the probabilities of getting the observed numbers of correct
% responses at *all* the stimulus levels, according to these values of mu
% and sigma?
binopdf( ncorrect, ntrials, fitfn( stimlev, mu, sigma ) )

% what's the joint probability of all these observed numbers of correct
% responses, according to these values of mu and sigma?
prod( binopdf( ncorrect, ntrials, fitfn( stimlev, mu, sigma ) ) )

% the number resulting from the previous line was *very* small, so we
% might be concerned about underflow errors, i.e., results being rounded
% down to zero.  so we'll deal with the logarithm of the probability
% instead.
-sum(log( binopdf( ncorrect, ntrials, fitfn( stimlev, mu, sigma ) ) ))

% forget about our guesses for mu and sigma, and make the line above
% into a function of a variable p (which is a 1 x 2 matrix)
nllike = @( p ) -sum(log( binopdf( ncorrect, ntrials, fitfn( stimlev, p(1), p(2) ) ) ));

% get fminsearch to find the value of p that minimizes the negative log likelihood
phat = fminsearch( nllike, [ 0.10 0.20 ] );

% these are the maxium likelihood estimates of mu and sigma.  done!
muhat = phat(1)
sigmahat = phat(2)
