% timetest.m  Check the effective frame rate when using PutImage
%             and CopyWindow

clear; clc;

% choose method of drawing image to screen
putimage = 1;

% set psychtoolbox preferences
Screen('Preference', 'SkipSyncTests', 2 );
Screen('Preference', 'SuppressAllWarnings', 1 );

% open main window
[winID,winRect] = Screen('OpenWindow', 0, 128 );

% make a matrix of random numbers
dim = [ 400 400 ];
im = randi( 256, [ dim 3 ] );

% find position that centers the matrix in the window
drawRect = CenterRect( [ 0 0 fliplr( dim ) ], winRect );

% if using CopyWindow, draw the matrix to an offscreen window
if ~putimage
    offRect = [ 0 0 fliplr( dim ) ];
    offID = Screen( 'OpenOffscreenWindow', winID, 0, offRect );
    Screen( 'PutImage', offID, im );
end

% draw the matrix to the window many times
tvec = NaN( [ 1 100 ] );
for i = 1:100
    
    % draw the matrix
    if putimage
        Screen( 'PutImage', winID, im, drawRect );
    else
        Screen( 'CopyWindow', offID, winID, offRect, drawRect );
    end
    
    % flip buffers and record the time
    tvec( i ) = Screen( 'Flip', winID );
    
end

% close main window
Screen('Close',winID);

% examine times between buffer flips, i.e., effective frame rate
hist( diff( tvec ) );
mu  = mean( diff( tvec ) )
