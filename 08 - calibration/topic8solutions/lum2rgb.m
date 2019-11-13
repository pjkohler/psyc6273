function g = lum2rgb( lum, k, delta )

% LUM2RGB  Convert luminance to greylevel using the model lum = k*g + delta
% 
%   g = lum2rgb( lum, k, delta )

g = (lum-delta)/k;

end
