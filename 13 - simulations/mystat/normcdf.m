function p = normcdf2( x, mu, sigma )

% NORMCDF2  Normal cumulative distribution function
%
% p = normcdf2( x, mu, sigma )
% <mu> is mean
% <sigma> is standard deviation

% 28-Oct-2008 -- created (RFM)

% convert to z-scores
p=zeros(size(x));
x=(x-mu)./sigma;

% handle positive scores
f=find(x>=0);
if ~isempty(f)
    p(f)=0.5+0.5*erf(x(f)/sqrt(2));
end

% handle negative scores
f=find(x<0);
if ~isempty(f)
    p(f)=0.5-0.5*erf(-x(f)/sqrt(2));
end

return
