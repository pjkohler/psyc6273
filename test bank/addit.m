function y = addit( x )

% ADDIT  Sum all the values ever passed as arguments

% declare global variable
global SUM

% add the argument into SUM
if isempty(SUM)
    SUM = x;
else
    SUM = SUM + x;
end

% return running total
y = SUM;

end
