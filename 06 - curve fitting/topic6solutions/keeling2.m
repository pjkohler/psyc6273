% keeling2.m  Fitting the Keeling curve.  attempt 2.

% Our first attempt (keeling1.m) captured the overall rise in CO2 levels,
% but not the annual cycle.  Now we'll add a sinusoidal term to the fit
% function to capture this as well.

clear; clc;

% load data
d = load('keeling.txt','-ascii');
x = d(:,4);  % get the decimal year
y = d(:,7);  % get the CO2 concentration

% choose a fit function; let's try the second-order polynomial from the
% first attempt, plus a sinusoid with adjustable size and phase
fitfn = @( a, p ) p(3)*a.^2 + p(2)*a + p(1) + p(4)*sin(2*pi*(a-p(5)));

% choose an error function; let's try sum of squares
errfn = @( p ) sum(( fitfn(x,p) - y ).^2);

% make a reasonable guess as to the fit parameters.  we'll use the
% polynomial coefficients that we got from the fit (phat) in
% keeling1.m, and we'll assign amplitude 5.0 (just a guess) to the
% sinusoid.
pinit = [ 46056 -48 0 5 0 ];

% find fit
phat = fminsearch(errfn,pinit);

% show results
clf;
plot(x,y,'r-');  % plot the data points
hold on
fplot(@(a)fitfn(a,phat),[ x(1) x(end) ],'b-');  % plot the fit
set( gca,'YLim',[ 270 410 ] );
xlabel 'year'
ylabel 'atmospheric CO_2 concentration (ppm)'
legend('data','fit','Location','NorthWest');

% add pre-industrial reference line
xlim = get(gca,'XLim');
plot( xlim, [ 280 280 ], 'g-' );
text( 1960, 285, 'pre-industrial concentration' );
hold off
