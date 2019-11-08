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

% 4e.  Make x a row vector with elements that are the maximum of each row
% of m.
x = max( m, [], 2 )';
% OR
x = max( m' );

% 4f.  Make x equal to all the elements of m that are greater than zero.
x = m( m>0 );

% 4g.  Make x equal to all the elements of m that are less than -1 or
% greater than 1.
x = m( m<-1 | m>1 );

% 4h.  Make x equal to one if all elements of m are greater than zero, and
% zero otherwise.
x = all( m(:)>0 );

% 4i.  Set any elements of m in the third column that are less than zero to
% NaN.
m( m(:,3)<0, 3 ) = NaN;

% 4j.  Set any rows of m that have a value less than -1.5 to NaN.
m( min(m,[],2)<-1.5, : ) = NaN;

% 4k.  Set x to the number of elements in m that are greater than 2.
x = sum( m(:)>2 );

% 4l.  Delete the fourth row of m.
m(4,:) = [];

% 4m.  Set the fourth column of m to zero in rows where the third column is
% less than zero.
m( m(:,3)<0, 4 ) = 0;

% 4n.  Set x to the rows of m that are less than zero in the third column.
x = m( m(:,3)<0, : );

% 4o.  Set f equal to the linear indices of the elements of m that are less
% than zero.
f = find( m<0 );

% 4p.  Use find() to set the elements of m that are less than zero to NaN.
m( find(m<0) ) = NaN;

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

% 8.  Write a for loop that prints all the prime numbers between 1 and 100.
for k = 1:100
    if isprime(k)
        fprintf('%d\n',k);
    end
end

% 9.  Write a while loop that finds the first prime number greater than 100.
i = 100;
while ~isprime( i )
    i = i + 1;
end
fprintf('the first prime greater than 100 is %d\n',i);

% 10.  Write Psychtoolbox code that will open a grey window to cover
% the whole screen.
winID = Screen('OpenWindow', 0, 128 );

% 11.  Write Psychtoolbox code that nulls the colour lookup table.
gtable = repmat( linspace(0,1,256)', [ 1 3 ] );
Screen('LoadNormalizedGammaTable',winID,gtable);

% 12.  Set a = 3.14 and b = 'abc'.  Use fprintf() to print the following
% message:  The value of a is 3.1400 and the value of b is 'abc'.
a = 3.14;
b = 'abc';
fprintf('The value of a is %.4f and the value of b is ''%s''.\n',a,b);

% 13.  Use fprintf() to write the prime numbers between 1 and 100 to a text
% file called prime.txt
fid = fopen('prime.txt','w');
for i = 1:100
    if isprime(i)
        fprintf(fid,'%.0f\n',i);
    end
end
fclose(fid);

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
fplot( @sin, [ 0 2*pi ], 'r-' );

% 16.  Use fplot to plot a sine wave on the interval [0,2*pi], and use
% handle graphics to set the width of the line to 5 pixels.
fplot( @sin, [ 0 2*pi ], 'r-' );
h = get(gca,'Children');
set(h,'LineWidth',3);

% 17.  Use fplot to plot a sine wave on the interval [0,2*pi], and use
% 'print' to save the figure to an .eps file called sine.eps.
fplot( @sin, [ 0 2*pi ], 'r-' );
print -depsc sine.eps

% 18.  Use fminsearch to find the values of x and y that minimize
% the function (x-3)^2 + (y-2)^2
errfn = @( p ) (p(1)-3)^2 + (p(2)-2)^2;
phat = fminsearch( errfn, [ 0 0 ] )

% 19.  Use fminsearch to find the number that has the minimum sum of
% squared distances to the numbers 1, 5, 10, and 20.
data = [ 1 5 10 20 ];
errfn = @( x ) sum( ( x - data ).^2 );
xhat = fminsearch( errfn, 0 )

% 20.  Write a function that takes a single argument and uses a global
% variable to store the sum of all the arguments ever passed to it.  The
% function also returns the current value of the global variable.
% solution:  see addit.m

% 21.  Write an inline function that implements the gamma function used in
% monitor calibration.
gammafn = @( x, p ) p(1)*power( ((max(min(x,255),p(2))-p(2)))/(255-p(2)), p(3) ) + p(4);
