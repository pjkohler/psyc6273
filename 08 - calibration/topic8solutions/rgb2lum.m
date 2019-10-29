function lum = rgb2lum( g, k, delta )

% RGB2LUM  Convert greylevel to luminance using the model lum = k*g + delta
% 
%   lum = rgb2lum( g, k, delta )

lum = k*g + delta;

end
