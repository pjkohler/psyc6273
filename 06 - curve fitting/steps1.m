% sum of squares fit of a sinusoid to some data, in steps

% here's our data
dx = [ -3.0 -2.5 -2.0 -1.5 -1.0 -0.5 0.0 0.5 1.0 1.5 2.0 2.5 3.0 ];
dy = [  1.0  1.1  0.1  0.7  0.6  0.5 0.9 1.3 2.1 2.1 1.2 1.9 1.2 ];

% here's the function we're going to fit to the data; we think of this as a
% function of one variable x, with three parameters a, b, and c that change
% the position and shape of the function
fitfn = @( x, a, b, c ) a + b*sin( x - c );

% here's a guess for a, b, and c
a = 1.2;
b = 0.6;
c = 0.1;

% what's the y-value at the first data point, according to these values of a, b, and c?
fitfn( dx(1), a, b, c )

% how different is that from the true y value at the first data point?
fitfn( dx(1), a, b, c ) - dy(1)

% square this, to get rid of any negative signs
( fitfn( dx(1), a, b, c ) - dy(1) )^2

% going back a few steps, what are the y-values at *all* the data points,
% according to these values of a, b, and c?
fitfn( dx, a, b, c )

% how different are these from *all* the true y values?
fitfn( dx, a, b, c ) - dy

% square this, to get rid of any negative signs
( fitfn( dx, a, b, c ) - dy ).^2

% add up these squared errors to get a single number for the error
sum( ( fitfn( dx, a, b, c ) - dy ).^2 )

% forget about our guesses for a, b, and c, and make the line above
% into a function of a variable p (which is a 1 x 3 matrix)
errfn = @( p ) sum( ( fitfn( dx, p(1), p(2), p(3) ) - dy ).^2 )

% get fminsearch to find the value of p that minimizes the error
phat = fminsearch( errfn, [ 0 0 0 ] )

% these are the minimum sum-of-squares estimates for a, b, and c.  done!
ahat = phat(1)
bhat = phat(2)
chat = phat(3)
