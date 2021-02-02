% testbank in class.m

% 1a.  Make x equal to a matrix that has the 0 to 20 in the first
% row and 20 to 40 in the second row and 40 to 60 in the third row. 
x = [ 0:20 ; 20:40; 40:60 ];

% 1b.  Make x equal to a 10 x 2 matrix that has numbers from -9 to 0 
% in the first column and from 1 to 10 in the second column.
x = reshape( -9:10, [ 10 2 ] );

% 2.  Make x equal to a 1 x 5 row vector of 5 linearly spaced numbers
% between 0 and 1 (both included):
x = linspace(0,1,5)';
% or
x = (0:.25:1)';

% 3.  Make x equal to a 8 x 3 matrix of random numbers uniformly drawn from
% the interval between -1 and 1
x = 2*rand( 8, 3 ) -1;

% 4.  In the following questions, use a matrix m that is a 4 x 25 matrix of
% normally distributed random numbers.  Resample a new matrix m for each
% question, e.g., don't let any changes to the matrix m in part (a) affect
% the matrix m that you use in part (b).
m = randn( 4, 25 );

% 4a.  Make x equal to the third column of m.
x = m( :, 3 );

% 4b.  Make x equal to the last row of m.
x = m( end, : );

% 4c.  Suppose you didn't know the size of matrix m.  Set a equal to the
% number of rows in m, and b equal to the number of columns.
[ a, b ] = size( m );

% 4d.  Suppose you didn't know the size of matrix m.  Set c equal to the
% number of elements in m.
c = numel( m );

% 4e.  Make x a row vector with elements that are the average of each row
% of m.
x = mean( m, 2 )'; 
% OR
x = mean( m' );
