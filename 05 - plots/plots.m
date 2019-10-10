%% plots.m  Demonstration code for MATLAB plots


%% basic plots

% plot
x = -180:20:180;
y = sind( x );
plot( x, y, 'ro-' );  % see 'help plot' for variants of 'ro-'
xlabel 'theta'
ylabel 'sin(theta)'
title 'a sine wave'
axis([ -180 180 -1.1 1.1 ]);

% opening, closing, and clearing figure windows
clf;
figure;
figure(5);
close;
close all;

% more information on 2D and 3D plots
help graph2d
help graph3d

% see also:  hist, bar, errorbar, loglog


%% multiple plots on a single set of axes

x = linspace(-pi,pi,10);
y = sin( x );
plot( x, y, 'ro-' );

hold on;
plot( x, 0.5*y, 'b-' );
plot( x, 0.4*y, 'go' );
hold off;

axis([ -pi pi -1.1 1.1 ]);
xlabel 'abscissa'
ylabel 'ordinate'
title 'a sampled sine wave'
legend('sine wave 1','sine wave 2','Location','NorthWest');

zoom on;


%% handle graphics

x = linspace(-pi,pi,10);
y = sin( x );
h = plot( x, y, 'ro-' );

set( h, 'LineWidth', 3, 'MarkerSize', 10, 'MarkerEdgeColor', 'g', ...
    'MarkerFaceColor', 'g' );  % set some line properties

get( h )              % see what properties the axes have
set( h, 'LineStyle')  % see what values the LineStyle property could be set to

set( gca, 'XLim', [ -pi pi ], 'YLim', [ -1.1 1.1 ] );  % set the axis limits
set( gca, 'FontName', 'helvetica', 'FontWeight', 'bold', 'FontSize', 18 );  % set the font
xlabel 'abscissa'
ylabel 'ordinate'
title 'a sampled sine wave'


%% plotting a function

% plotting an m-file function
subplot(1,2,1);

fplot( @sin, [ -pi pi ] );

h = get( gca, 'Children' );
set( h, 'LineWidth', 3 );
set( gca, 'FontName', 'helvetica', 'FontWeight', 'bold', 'FontSize', 18 );
xlabel 'abscissa'
ylabel 'ordinate'
axis square

% plotting an inline function
subplot(1,2,2);

myfunc = @( x ) 0.5 + 0.5*sin( 2*x );
fplot( myfunc, [ -pi pi ] );

set( gca, 'FontName', 'helvetica', 'FontWeight', 'bold', 'FontSize', 18 );
xlabel 'abscissa'
ylabel 'ordinate'
axis square


%% printing and saving plots

print -dtiff sine.tif            % save as .tif
print -dtiff -r600 sine600.tif   % save as higher-resolution .tif
print -depsc2 sine.eps           % save as encapsulated postscript
saveas(gcf,'sine');              % save as matlab figure
open( 'sine.fig' );              % re-open the matlab figure (can also just double click)
% print                          % print it on a printer


%% 3D plots

xy = linspace(-pi,pi,50);
[x,y] = meshgrid(xy,xy);

z = sin( x ) .* cos( 2*y );
surf( x, y, z );

xlabel 'x-axis'
ylabel 'y-axis'
zlabel 'z-axis'
title 'a sinusoidal surface'

rotate3d on                     % switch on interactive rotation mode
set(gca,'View',[ 45 60 ])       % set a specific viewpoint
colorbar;                       % show a colour bar

% other 3D plot commands:  mesh, plot3, contour3
