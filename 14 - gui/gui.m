% gui.m  Notes on the MATLAB GUI Development Environment (GUIDE)

% - open guide
guide;

% - use point-and-click interface to place objects (pushbuttons, etc.)

% - use object inspector to check and set object properties
% - some of the most important ones are
% 
%     'Tag' can be used to manually assign a unique string name to each
%         object
% 
%     'Callback' is a function that is called when the object generates
%         an event
% 
%     'String' is the label on a pushbutton etc., or the string that
%         a user enters into a textbox
%

% - from within a callback function, use findobj to get a handle to
%   other objects, e.g.,
% 
%     h = findobj( 'Tag', 'textbox1' );
% 
% - then use get and set to manipulate object properties, just like
%   you do with plots, e.g.,
% 
%     str = get( h, 'String' );
% 

