function [ x, y ] = randpos( t, tau )

% RANDPOS  Return ( x, y ) coordinates that change smoothly and
%          pseudorandomly over time
% 
% usage:  [ x, y ] = randpos( t )
% 
%   if t is the string 'init', then the function initializes itself and
%     creates a new random trajectory.
% 
%   if t is a real number, then the return arguments ( x, y ) are the
%     coordinates of the position calculated for time t.
% 
%   x and y are always in the range -1 to 1.

% initialize
persistent COEF
if ( ischar( t ) && strcmpi( t, 'init' ) ) || isempty( COEF )
    
    % choose random amplitudes and phases
    COEF.amp = 0.2+0.8*rand(6,1);
    COEF.phase = 2*pi*rand(6,1);
    
    % return if t is 'init'
    if ischar( t )
        return
    end
    
end

% calculate position
x = COEF.amp(1)*sin( ( 2*pi*t   / tau ) - COEF.phase(1) ) + ...
    COEF.amp(3)*sin( ( 2*pi*2*t / tau ) - COEF.phase(3) ) + ...
    COEF.amp(5)*sin( ( 2*pi*3*t / tau ) - COEF.phase(5) );
y = COEF.amp(2)*sin( ( 2*pi*t   / tau ) - COEF.phase(2) ) + ...
    COEF.amp(4)*sin( ( 2*pi*2*t / tau ) - COEF.phase(4) ) + ...
    COEF.amp(6)*sin( ( 2*pi*3*t / tau ) - COEF.phase(6) );
x = x / 3;
y = y / 3;

end
