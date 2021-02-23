%% plots.m  Demonstration code for MATLAB plots

%% basic plots

% plot
x = -180:20:180;
y = sind( x );
plot( x, y, 'ro-' );  % see 'help plot' for variants of 'ro-'

% color can also be specified directly
plot( x, y, 'o-' , 'color', [1 .2 0]); % a more orangy red, perhaps cooler?

xlabel 'theta'
ylabel 'sin(theta)'
title 'a sine wave'
axis([ -180 180 -1.1 1.1 ]);

% opening, closing, and clearing figure windows
clf;
figure;
figure(5); % make a specific figure window current
close; % close the current figure
close all; % close all figures

% more information on 2D and 3D plots
help graph2d
help graph3d

% see also:  hist / histogram, bar, errorbar, loglog

%% multiple plots on a single set of axes

x = linspace(-pi,pi,10);
y = sin( x );
plot( x, y, 'ro-' );

% hold on means that old figure content is retained when new content is added
hold on; 
p_h(1) = plot( x, 0.5*y, 'b-' );
p_h(2) = plot( x, 0.4*y, 'go' );
hold off;

axis([ -pi pi -1.1 1.1 ]);
xlabel 'abscissa'
ylabel 'ordinate'
title 'a sampled sine wave'
legend('sine wave 1', 'sine wave 2','Location','NorthWest');
% legend(p_h, 'sine wave 1', 'sine wave 2','Location','NorthWest');
zoom on;

%% plots, axes and graphic objects have handles

x = linspace(-pi,pi,10);
y = sin( x );
h = plot( x, y, 'ro-'); % returns the handle to the line

set( h, 'LineWidth', 3, 'MarkerSize', 10, 'MarkerEdgeColor', 'g', ...
    'MarkerFaceColor', 'g' );  % set some line properties

get( h )              % see what properties the axes have
set( h, 'LineStyle')  % see what values the LineStyle property could be set to

% get the handle of the current figure (gcf = GET CURRENT FIGURE)
fig_h = gcf;

% specify figure size (in centimeters)
set(fig_h, 'units', 'centimeters');
fig_pos = get(gcf,'pos'); % specified as [upper-left-x, upper-left-y, width, height]
fig_pos(3) = 15;
fig_pos(4) = 10;
set(gcf,'position',fig_pos);

% get the handle of the current axis (gca = GET CURRENT AXIS)
ax_h = gca;
set( ax_h, 'XLim', [ -pi pi ], 'YLim', [ -1.1 1.1 ] );  % set the axis limits
set( ax_h, 'FontName', 'helvetica', 'FontWeight', 'bold', 'FontSize', 18 );  % set the font
xlabel 'abscissa'
ylabel 'ordinate'
title 'a sampled sine wave'

% what if you want to do the same thing to a bunch of axes?
ax_params = {'FontName', 'helvetica', 'FontWeight', 'bold', 'FontSize', 18};
% "unwrap" the cell and pass it to set along with parameters specific to
% that axis
set( ax_h, ax_params{:}, 'XLim', [ -pi pi ], 'YLim', [ -1.1 1.1 ]); 

% you can get more sophisticated
l_width = 1;
f_size = 12;
text_params = {'fontweight','normal','fontname','Helvetica','fontsize',f_size};
ax_params = [{'tickdir','out','ticklength',[0.0200,0.0200],'box','off','linewidth',l_width}, text_params];

set( ax_h, ax_params{:}, 'XLim', [ -pi pi ], 'YLim', [ -1.1 1.1 ]); 

%% specifying figure size ahead of time, subplots
close all;
fig_h = figure; % will open a new figure window
set(fig_h, 'units', 'centimeters');
fig_pos = get(gcf,'pos');
fig_pos(3) = 20;
fig_pos(4) = 20;
set(gcf,'pos',fig_pos);

for f = 1:4
    subplot(2,2,f); % specify the subplot
    % plot an image from a matrix
    % the colors are scaled to use the full colormap
    imagesc(rand(10,10)*255); 
    if f > 2
        colormap(gca, 'gray');
    else
        colormap(gca, 'jet');
    end
    if mod(f,2)==0
        cb = colorbar('EastOutside');
        % we have to reposition the color bar
        cb_pos = get(cb,'position');
        cb_pos(1) = cb_pos(1) + cb_pos(3)*3; 
        set(cb, 'position', cb_pos, 'ytick',0:50:250, 'ylim',[0,255]);
    else
    end
    axis square;
    % apply same settings to each plot
    set( gca, ax_params{:}, 'xtick', 0:10, 'ytick', 0:10);
end

%% plotting a function

% plotting an m-file function
subplot(1,2,1);

hold on 
fplot( @sin, [ -pi pi ] );
fplot( @cos, [ -pi pi ] );
hold off

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
print -dpdf sine.pdf
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
