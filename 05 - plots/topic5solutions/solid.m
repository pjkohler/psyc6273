function solid( h )

% SOLID  Fill in the data markers on a plot
% 
% solid( h )
% 
% <h> is a graphics handle returned from plot

% get the main plot colour
c = get(h,'Color');

% set the marker face to the main plot colour
set(h,'MarkerFaceColor',c);

return
