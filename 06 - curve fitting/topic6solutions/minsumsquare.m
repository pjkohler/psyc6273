% minsumsquare.m  Find the minimum-sum-of-squares value for a dataset

clear; clc;

% sample 25 data points from [0,100]
data = 100*rand(25,1);

% make a function to calculate sum-of-squares between the data and any number
ssfn = @( k ) sum( ( data - k ).^2 );

% find the value that minimizes the sum-of-squares
khat = fminsearch( ssfn, 1 )

% find the mean
m = mean( data )

% khat and m are the same.   the mean is the single number that best
% summarizes the values in a dataset, in the sense that it has the
% least sum-of-squares error relative to the dataset.
