function r = binornd2( n, p )

% BINORND  Binomial random variable
%
% r = binornd2( n, p )
% <n> is the number of draws
% <p> is the probability of success

% 28-Oct-2008 -- created (RFM)

r=zeros(size(n));
for i = 1:max(n(:))
    k = find(n >= i);
    r(k) = r(k) + (rand(size(k)) < p(k));
end
r(p < 0 | 1 < p | n < 0 | round(n) ~= n) = NaN;

return
