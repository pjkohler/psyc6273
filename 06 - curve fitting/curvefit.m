%% curvefit.m  Curve fitting

%% inline functions

% we have covered how to make functions in M-files.

% we can also write simple functions as "inline functions", which
% are stored in variables like any other value

% a function of one variable
myfn = @( x ) x.^2;
myfn( 1 )
myfn( 2 )
fplot( myfn, [ -1 1 ] );

% a function of two variables
myfn = @( x, y ) x + y.^2;
myfn( 2, 3 )

% a function of a vector
myfn = @( p ) p(1) + p(2).^2;
myfn([ 2 3 ])
% in a way, this is the same as the function of two variables.
% it just expects its arguments in a 1 x 2 vector


%% fminsearch in 1D

% make an inline function to minimize
minfn = @( x ) x.^2;

% minimize it
xhat = fminsearch( minfn, 1 )

% show results
fplot( minfn, [ -1 1 ] );
hold on;
plot(xhat,minfn(xhat),'ro');
hold off;

% if minfn.m is an M-file, do this instead (note the @):
%   xhat = fminsearch( @minfn, 1 );
%   fplot( @minfn, [ -1 1 ] );

% rules for referring to functions
% - to refer to an inline function, use the function name
% - to refer to a function defined in an M-file, use @ followed by
%   the function name, i.e., the M-file name


%% fminsearch in 2D

% make a function to minimize
minfn = @( p ) ( (p(1)-1).^2 ) + ( (p(2)-2).^2 );

% minimize it
phat = fminsearch( minfn, [ 0 0 ] )

% again, if minfn.m is an M-file, do this instead (note the @):
%   phat = fminsearch( @minfn, [ 0 0 ] );


%% sum-of-squares curve fitting

% make some data to fit
dx = linspace(-pi,pi,20);
dy = 1 + 0.5*sin(dx) + 0.2*randn(size(dx));

% make the fitting function
fitfn = @( x, a, b, c ) a + b*sin( x - c );

% make the error function (sum-of-squares)
% (see steps1.m for a step-by-step construction of this function)
errfn = @( p ) sum( ( fitfn(dx,p(1),p(2),p(3)) - dy ).^2 );

% minimize the error function
phat = fminsearch(errfn,[ 0 1 0 ]);

% report results of fit
fprintf(1,'fit:  y = (%.2f) + (%.2f) * sin( x - (%.2f) )\n',phat(1),phat(2),phat(3));

% plot data and fitted function
clf;
plot(dx,dy,'ro');
hold on;
fplot(@(x)fitfn(x,phat(1),phat(2),phat(3)),[ -pi pi ]);
axis([ -pi pi -2 2 ]);


%% improving the fit by making several tries with different inital guesses

% make some data to fit
dx = linspace(-pi,pi,20);
dy = 1 + 0.5*sin(dx) + 0.2*randn(size(dx));

% make the fitting function
fitfn = @( x, a, b, c ) a + b*sin( x - c );

% make the error function (sum-of-squares)
errfn = @( p ) sum( ( fitfn(dx,p(1),p(2),p(3)) - dy ).^2 );

% minimize the error function several times from different starting points
minerr = Inf;
phat = [];
for i = 1:20
    
    % make a fit from a random starting point
    pinit = [ 2*randn rand -pi+2*pi*rand ];
    phat0 = fminsearch(errfn,pinit);
    
    % compare error to best so far
    err = errfn( phat0 );
    if err < minerr
        phat = phat0;
        minerr = err;
    end
    
end

% report results of fit
fprintf(1,'fit:  y = (%.2f) + (%.2f) * sin( x - (%.2f) )\n',phat(1),phat(2),phat(3));

% plot data and fitted function
clf;
plot(dx,dy,'ro');
hold on;
fplot(@(x)fitfn(x,phat(1),phat(2),phat(3)),[ -pi pi ]);
axis([ -pi pi -2 2 ]);


%% maximum-likelihood parameter estimation

% make some data to fit
d = 10 + 2*randn(1,50);

% make the error function
% errfn = @( p ) -prod( normpdf( d, p(1), p(2) ) );
errfn = @( p ) -sum(log( normpdf( d, p(1), p(2) ) ));
% note:  normpdf( x, mu, sigma ) is the probability density of a getting
%        a sample with value x from a normal distribution with mean mu
%        and standard deviation sigma

% minimize the error function
phat = fminsearch( errfn, [ 0 1 ] );

% report results of fit
fprintf('fit:  mu = %.2f, sigma = %.2f\n',phat);


%% maximum-likelihood curve fitting

% make some psychometric data to fit
stimlev =  [ 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 ];
ntrials =  [   20   20   20   20   20   20   20   20   20   20 ];
ncorrect = [   10   11   10   12   14   15   14   18   19   20 ];

% make the fitting function
% note:  normcdf( x, mu, sigma ) is a function of x that increases smoothly
%        from 0 to 1.  mu shifts it left or right, and sigma makes it
%        steeper or shallower.
fitfn = @( x, p ) 0.5 + 0.5*normcdf( x, p(1), p(2) );

% make the error function (negative log likelihood)
% (see steps2.m for a step-by-step construction of this function)
% note:  binopdf( x, n, p ) is the probability of having x successes
%        on n trials, when the probability of each success is p
errfn = @(p) -sum( log( binopdf( ncorrect, ntrials, fitfn(stimlev,p) ) ) );

% minimize the error function
phat = fminsearch( errfn, [ 0.1 0.1 ]);

% report results of fit
fprintf('fit:  p = 0.5 + 0.5*normpdf( x, %.2f, %.2f )\n',phat);
fprintf('75%% threshold:  %.2f\n',phat(1));

% plot data and fitted function
clf;
plot(stimlev,ncorrect./ntrials,'ro');
hold on;
fplot( @(x) fitfn(x,phat), [ 0 0.55 ] );
axis([ 0 0.55 0 1.1 ]);
xlabel 'stimulus contrast'
ylabel 'proportion correct'
