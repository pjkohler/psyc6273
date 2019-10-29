function a = myglobal1( x )

% MYGLOBAL1  Demonstrate how to use global variables
% 
%   a = myglobal1( x )

% declare global variable
global V

% adjust global variable
if isempty(V)
    V = x;
else
    V = V + x;
end

% return global variable
a = V;

end
