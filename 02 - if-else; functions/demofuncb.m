function [ x, y ] = demofuncb( a, b )

% DEMOFUNCB  Demonstrate how to program a function
%
%   [ x, y ] = demofuncb( a, b )
%
%    x is a + (a*b).  y is a - (a*b).

% do calculations
c = a * b;
x = a + c;
y = a - c;

end
