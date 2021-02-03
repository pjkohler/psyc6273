%% psychtoolbox3.m  How to use basic functions in the psychophysics toolbox

%% part 1 -- help
%  most of the primary functions in PTB are called like this:
%  Screen(command)
help Screen          % introduction
Screen               % list Screen commands
Screen OpenWindow?   % get help on a specific Screen command

%% part 2 -- setting up and shutting down

% set preferences
Screen('Preference', 'SkipSyncTests', 2 );
Screen('Preference', 'SuppressAllWarnings', 1 );

scr_no = 0; % screen number variable
% open a window
Screen('OpenWindow', scr_no, 128 ); sca;

% sca or Screen('CloseAll')
% close all open screens

% get screen size in pixels
[size_pix(1), size_pix(2)] = Screen('WindowSize', scr_no);
% get screen size in mm
[size_mm(1), size_mm(2)] = Screen('DisplaySize', scr_no);

% we define a rect to indicate where we can the screen
upper_right = [size_pix(1)/2, 0, size_pix(1), size_pix(2)/2];
% open a window that does not fill the whole screen (useful for debugging)
[w_pt, rect] = Screen('OpenWindow', scr_no, [255, 128, 0], upper_right);

% w_pt: window pointer that can be used to refer to the Screen later

% rect: coordinates of the windows we just opened [left,top,right,bottom]
%       can be used to get the window size
%       and to easily place an object in the center of the screen

% hide the cursor, so it does not interfere with your experiment
HideCursor;

ListenChar(2); 
% Tell the Psychtoolbox function "GetChar" to start or stop listening for keyboard input.
% Passing "2" to ListenChar will start listening and suppress output of
% keypresses to the Matlab command line (practical when running
% experiments)

% IMPORTANT!!!
% ctrl-c will terminate the ongoing program, and give you access to the
% command line. ctrl-c and then typing sca

% set the colour lookup table ( = clut = gamma table )
gtable = repmat( (0:255)'/255, [ 1 3 ] ); 
% define a table of 256 values (0-255)
% linearly spaced between 0 and 1
Screen('LoadNormalizedGammaTable',w_pt,gtable);
% note: these values could be defined by measuring your screen
% with a photometer, e.g. using the function
% CalibrateMonitorPhotometer

% close main window, show mouse cursor, echo keyboard input
Screen('Close',w_pt);
ShowCursor;
ListenChar;

% make sure all on- and offscreen windows are closed
Screen('CloseAll');
% short form:  sca

%% part 3 -- showing things onscreen

% open main window
[w_pt, rect] = Screen('OpenWindow', 0, 128, upper_right );
pause(0.5);

% make a square of coloured noise and write it to the onscreen window
n = 256;
im = round(255*rand(n,n,3));
Screen('PutImage',w_pt,im,[ 100 100 100+n 100+n ]);
Screen('Flip',w_pt);
KbWait; pause(0.1);

% make a square of grey noise and write it to the onscreen window
n = 256;
im = round(255*rand(n,n));
Screen('PutImage',w_pt,im,[ 100 100 100+n 100+n ]);
Screen('Flip',w_pt);
KbWait; pause(0.1);
   
% load an image and show it onscreen
im = imread('einstein.tif');
[m,n] = size(im);
Screen('PutImage',w_pt,im,[ 100 100 100+n 100+m ]);
Screen('Flip',w_pt);   
KbWait; pause(0.1);

Screen('Close',w_pt);        

% other Screen commands for drawing
% - FillRect, FrameRect, FillOval, FrameOval
% - FillPoly, DrawLine
% - DrawText, GetImage
% - also see imwrite


%% part 4 -- getting user input

% detour:  cell arrays and strcmp
a = { 'abc' [ 1 2 3 ; 4 5 6 ] 1 }
% each cell can contain any variable type
% string, matrix, array, scalar
%
% can be treated just like regular matrices: 
z = a{2}                 % linear indexing
x = a{1,2}               % subscript indexing
y = a(1,2)               % does the same thing, but does not 'unwrap' the cell content
                         % returns a 1 x 1 cell matrix
a{ [ 3 2 1 ]==2 }    % logical indexing

b = { 'abc' 'def' 'ghi' }
strcmp( b, 'abc' )
% ismember(b, 'abc') does the same thing, but more general, e.g.
c = ismember([1 2 3 0 9], [2, 4])
any( strcmp( b, 'abc' ) )
%% 
% open main window
[w_pt, rect] = Screen('OpenWindow', 0, 128, upper_right );

% turn off keyboard echoing; can undo this by typing control-C
ListenChar(2);

% get a keypress:  wait for user to press 0, 1, or 2
while 1

    % get the keycode
    [downflag,presstime,keycode] = KbCheck;
    
    % get the key name
    key = KbName(keycode);
    
    % '0)' '1!' and '2@' is just how Matlab represents the keys 0,1,2
    % check the key name
    if any(strcmp(key,'0)')) || any(strcmp(key,'1!')) || any(strcmp(key,'2@')) || any(strcmp(key,'s'))
        break
    end
    % we could change a variable and stop the while loop, 
    % but breaking is more effective. 
    
end
fprintf('user pressed key %s\n',key);
% see also:  KbWait, GetChar, CharAvail

% get a line of input
str = GetEchoString(w_pt,'Enter the subject code:',100,200,255,128);
fprintf('subject code is %s\n',str);
% see also:  GetNumber, GetString, GetEchoNumber

% mouse input
[x,y,buttons]=GetMouse;
fprintf('mouse position is (%.0f, %.0f)\n',x,y);
fprintf('button state is %d %d %d\n',buttons);
% see also:  SetMouse (position mouse cursor on the screen)

% shut down
ListenChar(0);         % turn keyboard echoing back on
Screen('Close', w_pt);  % close window

%% part 5 -- offscreen windows
% open main window
[w_pt, rect] = Screen('OpenWindow', 0, 128, upper_right );

% make some image matrices
n = 256;
im1 = round(255*rand(n,n,3));
im2 = round(255*rand(n,n,3));
im3 = repmat(128,[ n n 3 ]);

% open offscreen windows
off_pt1 = Screen('OpenOffscreenWindow',w_pt,0,[ 0 0 n n ]);
off_pt2 = Screen('OpenOffscreenWindow',w_pt,0,[ 0 0 n n ]);
off_pt3 = Screen('OpenOffscreenWindow',w_pt,0,[ 0 0 n n ]);

% write image matrices to offscreen windows (slow)
Screen('PutImage',off_pt1,im1,[ 0 0 n n ]);
Screen('PutImage',off_pt2,im2,[ 0 0 n n ]);
Screen('PutImage',off_pt3,im3,[ 0 0 n n ]);

% get the rect for the image location
% by centering the image rect inside the screen rect
center_rect = CenterRect([ 0 0 n n ],rect);

% get the current time
t = GetSecs;
% show the noise images (fast)
Screen('CopyWindow',off_pt1,w_pt,[ 0 0 n n ],center_rect);
t_stamp(1) = Screen('Flip',w_pt,t+1);
Screen('CopyWindow',off_pt2,w_pt,[ 0 0 n n ],center_rect);
t_stamp(2) = Screen('Flip',w_pt,t+2);
Screen('CopyWindow',off_pt3,w_pt,[ 0 0 n n ],center_rect);
t_stamp(3) = Screen('Flip',w_pt,t+3);
pause(1);

Screen('Close',w_pt);

%% part 6 -- textures
% In the OpenGL Psychtoolbox textures replace 
% offscreen windows for fast drawing of images during animation.

% open main window
[w_pt, rect] = Screen('OpenWindow', 0, 128, upper_right );

% make some image matrices
n = 256;
im1 = round(255*rand(n,n,3));
im2 = round(255*rand(n,n,3));
im3 = repmat(128,[ n n 3 ]);

% convert the image matrices into textures (slow)
off_pt1 = Screen('MakeTexture',w_pt,im1);
off_pt2 = Screen('MakeTexture',w_pt,im2);
off_pt3 = Screen('MakeTexture',w_pt,im3);

% get the current time
t = GetSecs;

% show the noise images (fast)
Screen('DrawTexture',w_pt,off_pt1,[ 0 0 n n ],[ 100 100 100+n 100+n ]);
Screen('Flip',w_pt,t+1);
Screen('DrawTexture',w_pt,off_pt2,[ 0 0 n n ],[ 100 100 100+n 100+n ]);
Screen('Flip',w_pt,t+2);
Screen('DrawTexture',w_pt,off_pt3,[ 0 0 n n ],[ 100 100 100+n 100+n ]);
Screen('Flip',w_pt,t+3);
pause(1);

Screen('Close',w_pt);
