function r = randnc1( m, n )

% RANDNC1  Sample from a clipped standard normal distribution
%          i.e., sample from N(0,1), but only return values in the range [-2,2]
% 
% r = randnc1( m, n )

% get a first sample
r = randn(m,n);

% look for outliers
k = abs(r) > 2;

% loop until there are no outliers
while any( k(:) )
    
    % resample the outliers
    n = sum( k(:) );
    r(k) = randn([ n 1 ]);
    
    % look for outliers again
    k = abs(r)>2;
    % note that this is inefficient, because we check *all* the elements
    % of r each time, whereas we really only need to check the ones that were
    % outliers before, to see if they're still outliers.  see randnc2.m for
    % a more efficient method.
    
end

end
