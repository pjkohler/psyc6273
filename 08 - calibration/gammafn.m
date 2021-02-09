function lum = gammafn( g, p )

% GAM  Gamma function for monitor calibration
% 
% lum = gammafn( g, p )

% get gamma function parameters
k = p(1);
g0 = p(2); % lowest possible value
gamexp = p(3); % gamma exponent
delta = p(4); 

% initialize luminances
lum = NaN(size(g));

% set luminances for greylevels below g0
lum( g<g0 ) = delta;

% set luminances for greylevels above 255
lum( g>255 ) = k+delta;

% set luminances for greylevels between g0 and 255
i = (g>=g0) & (g<=255);
lum( i ) = k*power( (g(i)-g0)/(255-g0), gamexp ) + delta;

end
