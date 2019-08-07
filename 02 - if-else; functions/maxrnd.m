function r = maxrnd( ksamp, nsamp )

% MAXRND  Random number generator that returns the maximum of
%         several samples from the standard normal distribution
% 
%     r = maxrnd( ksamp, nsamp )
% 
%     r is an 1 x nsamp matrix, each element of which is the
%     maximum of ksamp samples from the standard normal distribution

% get samples from standard normal distribution
% (matrix of random values with ksamp rows and nsamp columns)
a = randn( ksamp, nsamp );

% get maximum of each column
r = max( a );

end
