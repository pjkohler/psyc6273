% testbank.m

% 1.  Make x equal to a matrix that has the numbers 100 to 200 in the first
% row and 300 to 400 in the second row.

% 2.  Make x equal to a matrix that has the numbers 1 to 20 in the first
% column and 21 to 40 in the second column.

% 3.  Make x equal to a 4 x 6 matrix of random numbers uniformly drawn from
% the interval between 10 and 15.

% 4.  In the following questions, use a matrix m that is a 20 x 5 matrix of
% normally distributed random numbers.  Resample a new matrix m for each
% question, e.g., don't let any changes to the matrix m in part (a) affect
% the matrix m that you use in part (b).

% 4a.  Make x equal to the first row of m.

% 4b.  Make x equal to the last column of m.

% 4c.  Suppose you didn't know the size of matrix m.  Set a equal to the
% number of rows in m, and b equal to the number of columns.

% 4d.  Suppose you didn't know the size of matrix m.  Set c equal to the
% number of elements in m.

% 4e.  Make x a row vector with elements that are the maximum of each row
% of m.

% 4f.  Make x equal to all the elements of m that are greater than zero.

% 4g.  Make x equal to all the elements of m that are less than -1 or
% greater than 1.

% 4h.  Make x equal to one if all elements of m are greater than zero, and
% zero otherwise.

% 4i.  Set any elements of m in the third column that are less than zero to
% NaN.

% 4j.  Set any rows of m that have a value less than -1.5 to NaN.

% 4k.  Set x to the number of elements in m that are greater than 2.

% 4l.  Delete the fourth row of m.

% 4m.  Set the fourth column of m to zero in rows where the third column is
% less than zero.

% 4n.  Set x to the rows of m that are less than zero in the third column.

% 4o.  Set f equal to the linear indices of the elements of m that are less
% than zero.

% 4p.  Use find() to set the elements of m that are less than zero to NaN.

% 5.  Write code that will set the variable s to -1 if x is less than zero,
% set s to 0 if x is equal to zero, and set s to 1 if x is greater than
% zero.  The value NaN does not meet any of these conditions, so if x does
% not meet any of the above conditions, then set s to NaN.

% 6.  Write a function that takes two input arguments, and returns the sum
% of their absolute values.

% 7.  Write a function called testit.m that takes two arguments, and
% returns -1 if the first argument is greater, 0 if they are equal, and 1
% if the second argument is greater.

% 8.  Write a for loop that prints all the prime numbers between 1 and 100.

% 9.  Write a while loop that finds the first prime number greater than 100.

% 10.  Write Psychtoolbox code that will open a grey window to cover
% the whole screen.

% 11.  Write Psychtoolbox code that nulls the colour lookup table.

% 12.  Set a = 3.14 and b = 'abc'.  Use fprintf() to print the following
% message:  The value of a is 3.1400 and the value of b is 'abc'.

% 13.  Use fprintf() to write the prime numbers between 1 and 100 to a text
% file called prime.txt

% 14.  Set x equal to 20 samples from -pi to pi.  Set y equal to the tangent
% of x.  Plot y versus x with a solid green line and no data point markers.
% Label the axes 'angle' and 'tangent'.
x = linspace(-pi,pi,20);
y = tan(x);
plot(x,y,'g-');
xlabel angle
ylabel tangent

% 15.  Use fplot to plot a sine wave on the interval [ 0, 2*pi ] with
% a red line.

% 16.  Use fplot to plot a sine wave on the interval [0,2*pi], and use
% handle graphics to set the width of the line to 3 pixels.

% 17.  Use fplot to plot a sine wave on the interval [0,2*pi], and use
% 'print' to save the figure to an .eps file called sine.eps.

% 18.  Use fminsearch to find the values of x and y that minimize
% the function (x-3)^2 + (y-2)^2

% 19.  Use fminsearch to find the number that has the minimum sum of
% squared distances to the numbers 1, 5, 10, and 20.

% 20.  Write a function that takes a single argument and uses a global
% variable to store the sum of all the arguments ever passed to it.  The
% function also returns the current value of the global variable.

% 21.  Write an inline function that implements the gamma function used in
% monitor calibration.

% 22.  Define x as a 2 x 2 cell array that contains an integer, a string,
% and two matrices.  Make a equal to a cell array that is the top row of x.

% 23.  Make matrices x and y that are 128 x 128 coordinate matrices.
