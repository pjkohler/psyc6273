function r = randnc2( m, n )

% RANDNC2  Sample from a clipped standard normal distribution
%          i.e., sample from N(0,1), but only return values in the range [-2,2]
% 
% r = randnc2( m, n )

% make initial sample
r = randn(m,n);

% find initial outliers
f = find( abs(r)>2 );

% loop until outliers are gone
while ~isempty(f)
    
    % resample the outliers
    r(f) = randn(numel(f),1);
    
    % see whether the resampled values are still outliers
    f = f( abs(r(f))>2 );
    
end

return
