%% code2_functions.m  Demonstration code for functions


%% scripts

% this m-file is a script

% show help text for a script
help code2_functions

% look for help text that contains some word
lookfor demonstration

% percent sign starts a comment

%{
    percent sign and set brace start a comment block that
    can continue for several lines
%}


%% functions

% see demofunca.m, demofuncb.m

u = demofunca( 10, 20 )

[ u, v ] = demofuncb( 10, 20 )

% - there are different workspaces inside and outside a function (i.e., variables are local)
% 	- command window, base workspace
% 	- separate workspaces for command window and each function
% 	- scripts have same workspace as command window
% - input and output arguments are not related to variables in the calling function
% - use tilde to skip return arguments
% - functions can have no return arguments
% - functions can have no input arguments
% - functions don't normally print their return arguments


%% exercises

% chapter 3, exercises 2, 27, 31
