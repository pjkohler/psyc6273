% ebbinghaus.m  Measure the Ebbinghaus illusion

clear; clc;

% set experiment parameters
bggrey = 128;        % background rgb
fggrey = 255;        % foreground rgb
radius1iP = 50;      % inner circle radius (left stimulus)
radius1oP = 70;      % outer circle radius (left stimulus)
radius2iminP = 40;   % inner circle minimum radius (right stimulus)
radius2imaxP = 60;   % inner circle maximum radius (right stimulus)
radius2oP = 30;      % outer circle radius (right stimulus)
distP = 80;          % distance between inner and outer circles

% set preferences
Screen('Preference', 'SkipSyncTests', 2 );
Screen('Preference', 'SuppressAllWarnings',1);

% open the main window
[winID,winRect] = Screen('OpenWindow', 0, bggrey );
HideCursor;

% set the colour lookup (gamma) table
gtable = repmat( linspace(0,1,256)', [ 1 3 ] );
Screen('LoadNormalizedGammaTable',winID,gtable);

% calculate stimulus midpoints
mid1 = round([ (2/5)*winRect(3) winRect(4)/2 ]);
mid2 = round([ (3/5)*winRect(3) winRect(4)/2 ]);

% create an offscreen window the same size as the onscreen window
offID = Screen('OpenOffscreenWindow',winID,bggrey,winRect);

% draw outer circles in offscreen window
for theta = 0:60:300
    
    % left stimulus
    mid = mid1 + distP*[ cosd(theta) sind(theta) ];
    Screen('FillOval',offID,fggrey,[ mid-radius1oP/2 mid+radius1oP/2 ]);
    
    % right stimulus
    mid = mid2 + distP*[ cosd(theta) sind(theta) ];
    Screen('FillOval',offID,fggrey,[ mid-radius2oP/2 mid+radius2oP/2 ]);
    
end

% draw left inner circle in offscreen window
Screen('FillOval',offID,fggrey,[ mid1-radius1iP/2 mid1+radius1iP/2 ]);

% put the mouse cursor at a random initial location
SetMouse( round(rand*winRect(3)), round(rand*winRect(4)) );

% loop until user quits
while 1
    
    % check the mouse
    [x,y,b] = GetMouse;
    if any(b)
        break
    end
    
    % calculate the current radius
    % based on mouse y position
    radius2iP = radius2imaxP - (radius2imaxP-radius2iminP)*(y/winRect(4));
    
    % draw the unvarying part of stimulus
    % by copying from the off window
    Screen('CopyWindow',offID,winID,winRect,winRect);
    
    % draw the adjustable circle
    Screen('FillOval',winID,fggrey,[ mid2-radius2iP/2 mid2+radius2iP/2 ]);
    
    % show it
    Screen('Flip',winID);
    
end

% shut down
ShowCursor;
Screen('Close',winID);
Screen('CloseAll');

% show results
fprintf('left radius %.2f, right radius %.2f\n',radius1iP,radius2iP);
