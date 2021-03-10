% problem1.m  Solutions to problem set 1, problem 1

clear; clc;

% (a) simulate stimulus numbers
stimnum = randi( 3, [ 100 1 ] );

% simulate reaction times
rt = 0.1 + randn( size(stimnum) ) .^ 2;

% simulate correct/incorrect responses
correct = rand( size(stimnum) ) < 0.80;

% (b) find mean reaction time on trials where stimulus 1 was shown
mean1 = mean( rt( stimnum == 1 ) );

% (c) find mean reaction time on trials where stimulus 2 as shown
% and the observer gave the correct response
mean2 = mean( rt( stimnum == 2 & correct == 1 ) );

% (d) make more realistic reaction times
rt = NaN( [ 100 1 ] );
k = ( correct == 1 );
ncorrect = sum( k );
rt(  k ) = 0.3 + randn( [ ncorrect 1 ] ) .^ 2;
rt( ~k ) = 0.1 + randn( [ numel(rt)-ncorrect 1 ] ) .^ 2;
