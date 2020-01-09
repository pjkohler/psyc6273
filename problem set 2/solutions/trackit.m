% trackit.m  Tracking experiment

clear; clc;

% set parameters
bggrey = 128;       % background greylevel
dotgrey = 200;      % dot greylevel
dotradiusP = 5;     % dot radius
mousegrey = 0;      % mouse cursor greylevel
mousesizeP = 10;    % mouse cursor size
sqsizeP = 800;      % width of square that bounds dot trajectory
tauS = 10;          % trial duration
ntrials = 10;       % number of trials

% set preferences
Screen('Preference', 'SkipSyncTests', 2 );
Screen('Preference', 'SuppressAllWarnings',1);

% open main window and hide mouse cursor
[winID,winRect] = Screen('OpenWindow',0,bggrey);
HideCursor;

% set the colour lookup table
gtable  = repmat( linspace(0,1,256)', [ 1 3 ] );
gtable0 = Screen('LoadNormalizedGammaTable',winID,gtable);

% find middle of screen
[ midx, midy ] = RectCenter( winRect );

% initialize data record
init = NaN( [ 1 round( 1.5 * tauS * 60 ) ] );
trial0.time = init;
trial0.mousex = init;
trial0.mousey = init;
trial0.dotx = init;
trial0.doty = init;
trial0.error = init;
trial = repmat( trial0, [ 1 ntrials ] );

% run trials
for t = 1:ntrials
    
    % pause before trial
    Screen( 'FillRect', winID, bggrey );
    Screen('Flip',winID);
    pause( 2 );
    
    % initialize record for this trial
    trial(t) = trial0;
    
    % record trial start time
    t1 = GetSecs;
    
    % initialize mouse button flag
    buttons = 0;
    
    % main loop
    i = 0;
    while ~any(buttons)
        i = i + 1;
        
        % get mouse position and button status
        [ trial(t).mousex(i), trial(t).mousey(i), buttons] = GetMouse;
        
        % check the time
        t2 = GetSecs - t1;
        if t2 > tauS
            break
        end
        trial(t).time(i) = t2;
        
        % get current dot position
        [ x, y ] = randpos( trial(t).time(i), tauS );
        trial(t).dotx(i) = round( midx + (sqsizeP/2) * x );
        trial(t).doty(i) = round( midy + (sqsizeP/2) * y );
        
        % record error
        dx = trial(t).mousex(i) - trial(t).dotx(i);
        dy = trial(t).mousey(i) - trial(t).doty(i);
        trial(t).error( i ) = sqrt( dx^2 + dy^2 );
        
        % draw dot
        Screen( 'FillRect', winID, bggrey );
        Screen( 'FillOval', winID, dotgrey, ...
            [ trial(t).dotx(i) trial(t).doty(i) trial(t).dotx(i) trial(t).doty(i) ] + ...
            [ -dotradiusP -dotradiusP dotradiusP dotradiusP ] );
        
        % draw mouse cursor
        Screen( 'DrawLine', winID, mousegrey, trial(t).mousex(i)-mousesizeP, trial(t).mousey(i),            trial(t).mousex(i)+mousesizeP, trial(t).mousey(i)            );
        Screen( 'DrawLine', winID, mousegrey, trial(t).mousex(i),            trial(t).mousey(i)-mousesizeP, trial(t).mousex(i),            trial(t).mousey(i)+mousesizeP );
        Screen('Flip',winID);
        
    end
    
    % quit if buttons pressed
    if any( buttons )
        break
    end
    
    % discard unneeded parts of trial record
    k = ~isnan( trial(t).time );
    trial(t).time   = trial(t).time(k);
    trial(t).mousex = trial(t).mousex(k);
    trial(t).mousey = trial(t).mousey(k);
    trial(t).dotx   = trial(t).dotx(k);
    trial(t).doty   = trial(t).doty(k);
    trial(t).error  = trial(t).error(k);
    
end

% pause before ending
Screen( 'FillRect', winID, bggrey );
Screen('Flip',winID);
pause( 1 );

% restore lookup table and close window
Screen('LoadNormalizedGammaTable',winID,gtable0);
Screen('Close',winID);
ShowCursor;

% save results
save( 'trackit.mat', 'trial' );
