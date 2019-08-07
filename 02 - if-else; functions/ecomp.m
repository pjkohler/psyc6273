function k = ecomp( a, b )

% ECOMP  Find which of two matrices contains a more extreme value
% 
% k = ecomp( a, b )

% find extreme value in a
ea = max( abs( a(:) ) );

% find extreme value in b
eb = max( abs( b(:) ) );

% compare extrema
if ea > eb
    k = 1;
else
    k = 2;
end

end

% short version:  k = 1 + ( max(abs(b(:))) > max(abs(a(:))) );
