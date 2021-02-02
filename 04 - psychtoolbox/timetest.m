% timetest.m  Check the effective frame rate when using PutImage
%             and CopyWindow

clear; clc;

% choose method of drawing image to screen
putimage = 1;

% set psychtoolbox preferences
Screen('Preference', 'SkipSyncTests', 2 );
Screen('Preference', 'SuppressAllWarnings', 1 );

% open main window
[w_pt , w_rect] = Screen('OpenWindow', 0, 128 );

% make a matrix of random numbers
dim = [ 400 500 ]; % height by width
im = randi( 256, [ dim 3 ] );

% find position that centers the matrix in the window
drawRect = CenterRect( [ 0 0 fliplr( dim ) ], w_rect );

% if using CopyWindow, draw the matrix to an offscreen window
if ~putimage
    offRect = [ 0 0 fliplr( dim ) ];
    offID = Screen( 'OpenOffscreenWindow', w_pt, 0, offRect );
    Screen( 'PutImage', offID, im );
end

% draw the matrix to the window many times
tvec = NaN( [ 1 1000 ] );
for i = 1:1000
    
    % draw the matrix
    if putimage
        Screen( 'PutImage', w_pt, im, drawRect );
    else
        Screen( 'CopyWindow', offID, w_pt, offRect, drawRect );
    end
    
    % flip buffers and record the time
    tvec( i ) = Screen( 'Flip', w_pt );
    
end

% close main window
Screen('Close',w_pt);

tvec = tvec * 1000; % convert to ms

% examine times between buffer flips, i.e., effective frame rate
hist( diff( tvec ) );
mu  = mean( diff( tvec ) )
