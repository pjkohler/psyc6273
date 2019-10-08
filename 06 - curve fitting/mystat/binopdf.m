function y = binopdf2( x, n, p)

% BINOPDF  Binomial probability density function
%
% y = binopdf2( x, n, p )
% <n> is the number of draws
% <p> is the probability of success

% 28-Oct-2008 -- created (RFM)

y=zeros(size(x));

[errorcode x n p] = distchck(3,x,n,p);

% Binomial distribution is defined on positive integers less than N.
k = find(x >= 0  &  x == round(x)  &  x <= n);
if any(k)

    % First deal with borderline cases
    t = (p(k)==0);
    if any(t)
        kt = k(t);
        y(kt) = (x(kt)==0);
        k(t) = [];
    end

    t = (p(k)==1);
    if any(t)
        kt = k(t);
        y(kt) = (x(kt)==n(kt));
        k(t) = [];
    end

end

if any(k)
    nk = gammaln(n(k) + 1) - gammaln(x(k) + 1) - gammaln(n(k) - x(k) + 1);
    lny = nk + x(k).*log( p(k)) + (n(k) - x(k)).*log1p(-p(k));
    y(k) = exp(lny);
end

k1 = find(n < 0 | p < 0 | p > 1 | round(n) ~= n);
if any(k1)
    y(k1) = NaN;
end

return
