function [ lum, spect, lambda ] = photsim( rgb )

% PHOTSIM  Simulate a photometer and spectrometer
% 
% [ lum, spect, lambda ] = photsim( rgb )

% 24-Feb-2009 -- created (RFM)

% declare a persistent variable
persistent param

% initialize
if isempty(param)
    bump = @(x,mu,sigma) exp(-0.5*((x-mu)/sigma).^2);
    lambda=(400:20:700)';
    param.spectr=0.03*bump(lambda,650,100);
    param.spectg=0.06*bump(lambda,550,100);
    param.spectb=0.01*bump(lambda,450,100);
    param.specta=0.002*bump(lambda,500,200);
    param.gammap=[ 10 2 ];
    param.gamma=@(x)power((max(min(x,255),param.gammap(2))-param.gammap(1))/(255-param.gammap(1)),param.gammap(2));;
    param.vlambda=[ 0.0004 0.0040 0.0230 0.0600 0.1390 0.3230 0.7100 0.9540 0.9950 0.8700 0.6310 0.3810 0.1750 0.0610 0.0170 0.0041 ]';
end

% find spectrum
phos=param.gamma(rgb);
spect=phos(1)*param.spectr+phos(2)*param.spectg+phos(3)*param.spectb+param.specta;

% find luminance
lum=683*param.vlambda'*spect;

return
