% testbank.m

% 1.  Make x equal to a matrix that has the numbers 100 to 200 in the first
% row and 300 to 400 in the second row.
x = [ 100:200 ; 300:400 ];

% 2.  Make x equal to a matrix that has the numbers 1 to 20 in the first
% column and 21 to 40 in the second column.
x = reshape( 1:40, [ 20 2 ] );

% 3.  Make x equal to a 4 x 6 matrix of random numbers uniformly drawn from
% the interval between 10 and 15
x = 10 + 5*rand( 4, 6 );

% 4.  In the following questions, use a matrix m that is a 20 x 5 matrix of
% normally distributed random numbers.  Resample a new matrix m for each
% question, e.g., don't let any changes to the matrix m in part (a) affect
% the matrix m that you use in part (b).
m = randn( 20, 5 );

% 4a.  Make x equal to the first row of m.
x = m( 1, : );

% 4b.  Make x equal to the last column of m.
x = m( :, end );

% 4c.  Suppose you didn't know the size of matrix m.  Set a equal to the
% number of rows in m, and b equal to the number of columns.
[ a, b ] = size( m );

% 4d.  Suppose you didn't know the size of matrix m.  Set c equal to the
% number of elements in m.
c = numel( m );

% 5.  Write code that will set the variable s to -1 if x is less than zero,
% set s to 0 if x is equal to zero, and set s to 1 if x is greater than
% zero.  The value NaN does not meet any of these conditions, so if x does
% not meet any of the above conditions, then set s to NaN.
if x < 0
    s = -1;
elseif x == 0
    s = 0;
elseif x > 0
    s = 1;
else
    s = NaN;
end

% 6.  Write a function that takes two input arguments, and returns the sum
% of their absolute values.

% solution:  see addabs.m

% 7.  Write a function called testit.m that takes two arguments, and
% returns -1 if the first argument is greater, 0 if they are equal, and 1
% if the second argument is greater.

% solution:  see testit.m
