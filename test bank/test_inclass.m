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

%% TEST 2 STARTS HERE

% 4f.  Redefine m (see above). Make x equal to the number of elements of m smaller than -1.5
x = sum( m(:) < -1.5 );

% 4g.  Make x equal to all the elements of m that are less than -1 or
% greater than .5
x = m( m < -1 | m > .5);

% 4h.  Make x equal to one if any elements are between -.01 and .01 and 0 if
% no elements are in that range
x = any( abs(m(:)) < .01 );

% 4i.  Set any elements of m in the second row that are bigger than 1 to
% NaN.
m(2, m(2,:) > 1 ) = NaN;

% 4j. Redefine m. Make x equal to the number of columns whose sum is bigger than .5
m = randn( 4, 25 );
x = sum(sum(m,1) > .5);

% 4k. Delete the second, fifth and tenth column of m.
m(:,[2,5,10]) = [];

% 4l.  Redefine m. Set f equal to the linear indices of the elements of m
% that are bigger than .25.
m = randn( 4, 25 );
f = find(m > .25);

% 4m.  Use f to set the elements of m that are less than zero to NaN.
m(f) = NaN;

% 5.  Write a function called test_remain that takes two input arguments a and b, 
% returns the remainder after dividing a by b if the inputs are both
% positive, and NaN otherwise. 

% solution: see test_remain.m

% 6.  Write a function called test_randomize that takes any two-dimensional
% matrix as input, and returns a matrix of the same size, but with the
% values randomly shuffled. Bonus if you can make the function handle
% higher-dimensional matrices

% solution: see test_randomize.m

% 7.  Write a for loop that prints any number between 1 and 1000 that is divisible by 9 

for n = 1:1000
    if mod(n,9) == 0
        disp(n)
    else
    end
end

% 8.  Use a while loop to populate a variable prime_list containing 
% the first 8 prime numbers bigger than 100

prime_list = [];
n = 100;
while size(prime_list,1) < 8
    n = n + 1;
    if isprime(n)
        prime_list = cat(1, prime_list, n);
    else
    end
end

%% TEST 3 STARTS HERE

% 9a. Use the Psychtoolbox function Screen('WindowSize' ...) to get the
% size of your screen in pixels.
[size_pix(1), size_pix(2)] = Screen('WindowSize', 0);

% 9b. Use that information and write Psychtoolbox code that will open a RED window that will cover
% LOWER LEFT corner of the screen. 
lower_left = [size_pix(1)/2, size_pix(2)/2, size_pix(1), size_pix(2)];
[w_pt, rect] = Screen('OpenWindow', 0, [255, 0, 0], lower_left);

% 9c. Use the function CenterRect and Screen('FillOval' ...) to place a
% 100x100 yellow disc in the center of your red window.
circle_rect = CenterRect([0,0,100,100], rect);
Screen('FillOval', w_pt, [255 255 0], circle_rect);

% 9d. Use GetSecs to get the system time and Screen('Flip' ...) 
% to present your yellow disc. Then use FillOval again to draw
% a blue disc of the same size and position and use Flip again 
% to replace the yellow disc with the blue after 1 second. 
% Do not use offscreen windows or textures. 
t = GetSecs;
t1 = Screen('Flip',w_pt,t+1);
Screen('FillOval', w_pt, [0 0 255], circle_rect);
t2 = Screen('Flip',w_pt,t+2);

% 10. Close all screens and use 
% fprintf to print the following to the command line: 
% "the true delay between the two flips was x ms" 
% where x is the delay in milliseconds between the two flips, 
% computed from the output of Screen Flip,
% converted to milliseconds and displayed using fixed-point notation (%f)
% with two digits two the right of the decimal point
sca; 
delay_ms = (t2-t1) * 1000;
fprintf("\n the true delay between the two flips was %.2f ms \n", delay_ms)

%% TEST 4 STARTS HERE

% 11. Generate 100 random x and y values by sampling the normal distribution
% Plot x and y using green circles. 
% Plot the average of x and y with a red x.  

% 12.  Use fplot to plot cosine and sine of the 
% interval [ -pi, pi ] in red and blue,
% using a solid line and no data point markers

% 13.  Use the graphics handles returned by fplot to set the width of the lines to 3 pixels.

% 14. Use gca to remove the box around the plot, 
% set the tick direction to out ('tickdir' parameter),
% and set the font to normal weighted helvetica size 12. 

% 15. Set the limits of the x-axis to -pi to pi,
% and the limits of the y-axis to -1 to 1. 

% 16. use print to save in high-quality PNG format
% using the -r600 parameter. You pick the filename.

