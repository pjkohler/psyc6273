% keeling1.m  Fitting the Keeling curve.  attempt 1.

clear; clc;

% load data
d = load('keeling.txt','-ascii');
x = d(:,4);  % get the decimal year
y = d(:,7);  % get the CO2 concentration

% choose a fit function; let's try a second-order polynomial, y = c1*x^2 + c2*x + c3
fitfn = @( a, p ) p(3)*a.^2 + p(2)*a + p(1);

% choose an error function; let's try sum of squares
errfn = @( p ) sum(( fitfn(x,p) - y ).^2);

% make a reasonable guess for the fit parameters.  we'll choose a straight
% line that goes through the first and last data points.
m = (y(end)-y(1))/(x(end)-x(1));
b = y(1) - m*x(1);
pinit = [ b m 0 ];

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
