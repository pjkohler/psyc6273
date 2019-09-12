function v = testit( x, y )

% TESTIT  Return a flag that indicates which input argument is greater
%         or whether they are equal
% 
%   v = testit( x, y )

% test the input arguments
if x>y
    v = -1;
elseif x<y
    v = 1;
else
    v = 0;
end

end
