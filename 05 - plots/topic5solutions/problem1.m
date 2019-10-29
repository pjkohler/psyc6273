% problem1.m

% make x values
x = 2*pi*rand(1,10);

% plot data points
plot( x, sin(x), 'ro' );

% plot line
hold on
x = linspace(0,2*pi,100);
plot(x,sin(x),'g-');
hold off
axis([ 0 2*pi -1.1 1.1 ]);
