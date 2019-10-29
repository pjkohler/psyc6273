function a = mypersist( x )

% MYPERSIST  Demonstrate how to use persistent variables
% 
%   a = myglobal1( x )

% declare persistent variable
persistent P

% adjust persistent variable
if isempty(P)
    P = x;
else
    P = P + x;
end

% return persistent variable
a = P;

end
