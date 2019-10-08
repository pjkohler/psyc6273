function r = normrnd(mu,sigma,dim)

% NORMRND  Normal random number generator
% 
% r = normrnd(mu,sigma,dim)

r = mu + sigma*randn(dim);

end
