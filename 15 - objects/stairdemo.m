% stairdemo.m

clear; clc;

% create staircase object (can use stair or stair2)
s = stair( linspace( 0, 1, 11 ), [ 1 2 ] );

% get current stimulus level
s.stim

% report an incorrect trial
s.resp( 0 );

% get current stimulus level
s.stim

% report a correct trial
s.resp( 1 );

% get current stimulus level
s.stim

% report a correct trial
s.resp( 1 );

% get current stimulus level
s.stim
