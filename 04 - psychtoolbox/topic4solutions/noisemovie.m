% noisemovie.m  Looping noise movie

clear; clc;

% set stimulus properties
sizen=256;  % frame size in pixels
framen=30;  % number of frames in movie

% set preferences
Screen('Preference', 'SkipSyncTests', 2 );
Screen('Preference', 'SuppressAllWarnings',1);

% open main window
[winID,winRect]=Screen('OpenWindow',0,128);
HideCursor;
ListenChar(2);

% set the colour lookup table
gtable = repmat( linspace(0,1,256)', [ 1 3 ] );
Screen('LoadNormalizedGammaTable',winID,gtable);

% find position of rectangle centered on screen
drawRect=centrerect(winRect,[ sizen sizen ]);

% open offscreen windows and write noise images
for i=1:framen
    offID(i) = Screen('MakeTexture',winID,floor(256*rand(sizen)));
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
