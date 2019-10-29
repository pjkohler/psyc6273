function a = myglobal2( x )

% MYGLOBAL2  Demonstrate how to use global variables
% 
%   a = myglobal2( x )
 
% declare global variable
global V

% adjust global variable
if isempty(V)
    V = x;
else
    V = V * x;
end

% return global variable
a = V;

end
