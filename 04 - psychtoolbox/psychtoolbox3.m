%% psychtoolbox3.m  How to use basic functions in the psychophysics toolbox


%% part 1 -- setting up and shutting down

% set preferences
Screen('Preference', 'SkipSyncTests', 2 );
Screen('Preference', 'SuppressAllWarnings', 1 );

% open main window, hide mouse cursor, don't echo keyboard input
[winID,winRect] = Screen('OpenWindow', 0, 128 );
% HideCursor;
% ListenChar(2);

% set the colour lookup table ( = clut = gamma table )
gtable = repmat( (0:255)'/255, [ 1 3 ] );
Screen('LoadNormalizedGammaTable',winID,gtable);

% move command window to front
commandwindow;

% close main window, show mouse cursor, echo keyboard input
Screen('Close',winID);
% ShowCursor;
% ListenChar;

% make sure all on- and offscreen windows are closed
Screen('CloseAll');
% short form:  sca


%% part 2 -- help
help Screen          % introduction
Screen               % list Screen commands
Screen OpenWindow?   % get help on a specific Screen command


%% part 3 -- showing things onscreen

% open main window
[winID,winRect] = Screen('OpenWindow', 0, 128 );
pause(0.5);

% make a square of coloured noise and write it to the onscreen window
n = 256;
im = round(255*rand(n,n,3));
Screen('PutImage',winID,im,[ 100 100 100+n 100+n ]);
Screen('Flip',winID);
KbWait; pause(0.1);

% make a square of grey noise and write it to the onscreen window
n = 256;
im = round(255*rand(n,n));
Screen('PutImage',winID,im,[ 100 100 100+n 100+n ]);
Screen('Flip',winID);
KbWait; pause(0.1);

% load an image and show it onscreen
im = imread('einstein.tif');
[m,n] = size(im);
Screen('PutImage',winID,im,[ 100 100 100+n 100+m ]);
Screen('Flip',winID);
KbWait; pause(0.1);

Screen('Close',winID);        

% other Screen commands for drawing
% - FillRect, FrameRect, FillOval, FrameOval
% - FillPoly, DrawLine
% - DrawText, GetImage
% - also see imwrite


%% part 4 -- getting user input

% detour:  cell arrays and strcmp
a = { 'abc' [ 1 2 3 ; 4 5 6 ] 1 }
a{1,2}               % subscripts
a{ [ 3 2 1 ]==2 }    % logical indices

b = { 'abc' 'def' 'ghi' }
strcmp( b, 'abc' )
any( strcmp( b, 'abc' ) )

% open main window
[winID,winRect] = Screen('OpenWindow', 0, 128 );

% turn off keyboard echoing; can undo this by typing control-C
ListenChar(2);

% get a keypress:  wait for user to press 0, 1, or 2
while 1

    % get the keycode
    [downflag,presstime,keycode] = KbCheck;
    
    % get the key name
    key = KbName(keycode);
    
    % check the key name
    if any(strcmp(key,'0)')==1) || any(strcmp(key,'1!')==1) || any(strcmp(key,'2@')==1)
        break
    end
    
end
fprintf('user pressed key %s\n',key);
% see also:  KbWait, GetChar, CharAvail

% get a line of input
str = GetEchoString(winID,'Enter the subject code:',100,200,255,128);
fprintf('subject code is %s\n',str);
% see also:  GetNumber, GetString, GetEchoNumber

% mouse input
[x,y,buttons]=GetMouse;
fprintf('mouse position is (%.0f, %.0f)\n',x,y);
fprintf('button state is %d %d %d\n',buttons);
% see also:  SetMouse

% shut down
ListenChar(0);          % turn keyboard echoing back on
Screen('Close',winID);  % close window


%% part 5 -- offscreen windows

% open main window
[winID,winRect] = Screen('OpenWindow', 0, 128 );

% make some image matrices
n = 256;
im1 = round(255*rand(n,n,3));
im2 = round(255*rand(n,n,3));
im3 = repmat(128,[ n n 3 ]);

% open offscreen windows
offID1 = Screen('OpenOffscreenWindow',winID,0,[ 0 0 n n ]);
offID2 = Screen('OpenOffscreenWindow',winID,0,[ 0 0 n n ]);
offID3 = Screen('OpenOffscreenWindow',winID,0,[ 0 0 n n ]);

% write image matrices to offscreen windows (slow)
Screen('PutImage',offID1,im1,[ 0 0 n n ]);
Screen('PutImage',offID2,im2,[ 0 0 n n ]);
Screen('PutImage',offID3,im3,[ 0 0 n n ]);

% get the current time
t = GetSecs;

% show the noise images (fast)
Screen('CopyWindow',offID1,winID,[ 0 0 n n ],[ 100 100 100+n 100+n ]);
Screen('Flip',winID,t+1);
Screen('CopyWindow',offID2,winID,[ 0 0 n n ],[ 100 100 100+n 100+n ]);
Screen('Flip',winID,t+2);
Screen('CopyWindow',offID3,winID,[ 0 0 n n ],[ 100 100 100+n 100+n ]);
Screen('Flip',winID,t+3);

Screen('Close',winID);


%% part 6 -- textures

% open main window
[winID,winRect] = Screen('OpenWindow', 0, 128 );

% make some image matrices
n = 256;
im1 = round(255*rand(n,n,3));
im2 = round(255*rand(n,n,3));
im3 = repmat(128,[ n n 3 ]);

% convert the image matrices into textures (slow)
offID1 = Screen('MakeTexture',winID,im1);
offID2 = Screen('MakeTexture',winID,im2);
offID3 = Screen('MakeTexture',winID,im3);

% get the current time
t = GetSecs;

% show the noise images (fast)
Screen('DrawTexture',winID,offID1,[ 0 0 n n ],[ 0 0 n n ]);
Screen('Flip',winID,t+1);
Screen('DrawTexture',winID,offID2,[ 0 0 n n ],[ 0 0 n n ]);
Screen('Flip',winID,t+2);
Screen('DrawTexture',winID,offID3,[ 0 0 n n ],[ 0 0 n n ]);
Screen('Flip',winID,t+3);

Screen('Close',winID);
