% problem2.m

% set the radius
r = 2;

% choose values of theta
theta = 0:360;

% make x and y values
x = r*cosd(theta);
y = r*sind(theta);

% plot
plot(x,y);
axis([ -2.5 2.5 -2.5 2.5 ]);
axis equal
