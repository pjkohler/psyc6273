% gammasteps.m  Construction of the gamma calibration function, in steps

% 'clip' function restricts x to range [ a b ]
clip = @( x, a, b ) max( min( x, b ), a );

% choose some gamma function parameters for illustration
k = 100;
g0 = 10;
gamma = 2.1;
delta = 5;

% maps g from [ 0, 255 ] to range [ g0, 255 ]; parameter g0 controls point where function bottoms out
gamma1 = @( g ) clip(g,g0,255);
fplot( gamma1, [ 0 255 ]);

% maps g from [ 0, 255 ] to range [ 0, 255-g0 ]; parameter g0 controls point where function bottoms out
gamma2 = @( g ) clip(g,g0,255)-g0;
fplot( gamma2, [ 0 255 ]);

% maps g from [ 0, 255 ] to range [ 0 1 ]
gamma3 = @( g ) (clip(g,g0,255)-g0)/(255-g0);
fplot( gamma3, [ 0 255 ]);

% maps g from [ 0, 255 ] to range [ 0 1 ]; parameter gamma controls curvature
gamma4 = @( g ) power( (clip(g,g0,255)-g0)/(255-g0), gamma );
fplot( gamma4, [ 0 255 ]);

% maps g from [ 0, 255 ] to range [ 0 k ]; parameter k controls luminance range
gamma5 = @( g ) k*power( (clip(g,g0,255)-g0)/(255-g0), gamma );
fplot( gamma5, [ 0 255 ]);

% maps g from [ 0, 255 ] to range [ delta k+delta ]; parameter delta controls minimum luminance
gamma6 = @( g ) k*power( (clip(g,g0,255)-g0)/(255-g0), gamma ) + delta;
fplot( gamma6, [ 0 255 ]);
xlabel greylevel
ylabel luminance
