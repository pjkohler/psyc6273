% calibration.m  Illustrate greyscale calibration

clear; clc;


%%  part 1 -- make calibration measurements

% set preferences
Screen('Preference','SkipSyncTests',2);
Screen('Preference','SuppressAllWarnings',1);

% open the screen
[winID,winRect] = Screen('OpenWindow',0,128);
HideCursor;

% null the gamma table
gtable = repmat(linspace(0,1,256)',[ 1 3 ]);
Screen('LoadNormalizedGammaTable',winID,gtable);

% decide where to draw the test patch
drawRect = CenterRect([ 0 0 200 200 ],winRect);

% pick a set of greylevels
greylist = round( linspace(0,255,10) );
greylist = greylist( randperm(numel(greylist)) );

% initialize list of luminance measurements
lum = NaN(size(greylist));

% measure luminance at each greylevel
for i = 1:numel(greylist)
    
    % show a patch of this greylevel on the screen
    Screen('FillRect',winID,128,winRect);
    Screen('FillRect',winID,greylist(i),drawRect);
    Screen('Flip',winID);
    
    % measure the luminance of the patch
    pause(0.5);
    lum(i) = photsim(greylist(i)*[ 1 1 1 ]);
    
end

% close the screen
Screen('Close',winID);
ShowCursor;

%%  part 2 -- fit a gamma function to the calibration data

% make the error function
errfn = @( p ) sum( ( lum - gammafn(greylist,p) ).^2 );

% minimize the error function
phat = fminsearch(errfn,[ max(lum)-min(lum) 0 2 min(lum) ]);

% plot the data and the fit
figure(1); clf;
fplot( @(x) gammafn(x,phat), [ 0 255 ], 'b-'  ); hold on;
plot( greylist, lum, 'ro' ); hold off;
axis([ -1 256 0 1.1*max(lum) ]);
xlabel 'greylevel'
ylabel 'luminance'
legend('gamma fit','measurements','Location','NorthWest');
fprintf(1,'k = %.2f\ng0 = %.2f\ngamma = %.2f\ndelta = %.2f\n',phat);

% save calibration data
CAL.gamma = phat;
CAL.pixelsize = 0.0003;
CAL.framerate = 60;
save caldata.mat CAL


%% part 3 -- use the calibration data

% load calibration data
load caldata.mat CAL

% set viewing distance
viewdistM = 0.57;

% convert seconds to frames
stimdurS = 0.5;
stimdurF = stimdurS * CAL.framerate

% convert degrees to pixels
degperpixel = atand( CAL.pixelsize / viewdistM );
pixelperdeg = 1/degperpixel;
stimsizeD = 2.5;
stimsizeP = stimsizeD * pixelperdeg

% make a random luminance matrix
lummat = 50 + 25*rand(128,128);

% check luminance range
minlum = CAL.gamma(4);
maxlum = CAL.gamma(1)+CAL.gamma(4);
toolow =  (lummat<minlum);
toohigh = (lummat>maxlum);
if any( toolow(:) ) || any( toohigh(:) )
    warning('luminances out of range');
    lummat(toolow) = minlum;
    lummat(toohigh) = maxlum;
end

% convert
igammafn = @( lum ) (255-CAL.gamma(2))*power( (lum-CAL.gamma(4))/CAL.gamma(1), 1/CAL.gamma(3) ) + CAL.gamma(2);
rgbmat = igammafn( lummat );
rgbmat = round( rgbmat );
rgbmat = repmat(rgbmat,[ 1 1 3 ]);
imshow(rgbmat/255);
% Screen('PutImage',winID,rgbmat,[ 0 0 128 128 ]);


%% part 3 -- use the calibration data via a toolbox

% initialize toolbox
initcal;

% set viewing distance
setviewdist(0.57);

% convert seconds to frames
stimdurS = 0.5;
stimdurF = sec2frame( stimdurS )

% convert degrees to pixels
stimsizeD = 2.5;
stimsizeP = deg2pixel( stimsizeD )

% make luminance matrix
lummat = 50 + 25*rand(128,128);

% convert to rgb
rgbmat = lum2rgb( lummat );
imshow(rgbmat/255);

