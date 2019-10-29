% sinemovie.m  Looping sine wave movie

clear; clc;

% set stimulus properties
sizen=256;  % frame size in pixels
framen=60;  % number of frames in movie

% set preferences
Screen('Preference', 'SkipSyncTests', 2 );
Screen('Preference', 'SuppressAllWarnings',1);

% open main window
[winID,winRect]=Screen('OpenWindow',0,128);
HideCursor;
ListenChar(2);

% set the colour lookup (gamma) table
gtable = repmat( linspace(0,1,256)', [ 1 3 ] );
Screen('LoadNormalizedGammaTable',winID,gtable);

% find position of rectangle centered on screen
drawRect=centrerect(winRect,[ sizen sizen ]);

% open offscreen windows and write noise images
% (note that this is the only part of the code that differs from noisemovie.m)
% (we'll cover this type of code in detail in the lecture on image matrices)
x = repmat( 1:sizen, [ sizen 1 ] );
for i=1:framen
    mat = sin( 2*pi*x/16 - 2*pi*4*(i-1)/framen );
    mat = 127*( 1 + mat );
    offID(i) = Screen('MakeTexture',winID,round(mat));
end

% loop movie until a key is pressed
i=0;
while 1
    
    % increase frame number
    i=i+1;
    if i>framen
        i=1;
    end
    
    % show a frame
    Screen('DrawTexture',winID,offID(i),[ 0 0 sizen sizen ],drawRect);
    Screen('Flip',winID);
    
    % check for keypress
    if KbCheck, break; end
    
end

% close main window
Screen(winID,'Close');
ShowCursor;
ListenChar(0);
