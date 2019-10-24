% randdemo.m  Illustrate how to use the randpos function to get a
%             random trajectory

clear; clc; clf;

% initialize randpos
randpos( 'init' );

% prepare figure
figure(1);
hold on;
axis( [ -1 1 -1 1 ] );

% choose trial duration (seconds)
tau = 10;

% plot trajectory over time 0 to tau seconds
tic;
while 1
    
    % get current position
    [ x, y ] = randpos( toc, tau );
    plot( x, y, 'ro' );
    drawnow;
    
    % check the time
    if toc > tau
        break
    end
    
end

% In the actual experiment, don't have the dot leave a trail.  I'm just
% doing that here so that we can see the shape of the whole trajectory.
% 
% Also, program the experiment using the Psychophysics Toolbox, not a
% MATLAB figure window as I'm doing here.
