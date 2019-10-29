function a = mysub( x )

% MYSUB  Demonstrate how to use subfunctions
% 
%   a = mysub( x )

% do the first calculation
y = mycalc1( x );

% do the second calculation
a = mycalc2( y );

end

% first calculation
function m = mycalc1( n )
m = sqrt(n) + 3;
end

% second calculation
function m = mycalc2( n )
m = 3*n + 5;
end
