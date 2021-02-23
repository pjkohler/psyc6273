%% other.m  A few loose ends

%% debugging

% keyboard, dbstep, dbcont, dbquit
% dbstop if error 
%   is very useful
% - can also set breakpoints in the editor

% echo on/off

%% input and output

% get a number from user's input
r = input('prompt:  ');

% get a string from user's input
r = input('prompt:  ','s');

% show the value of a variable
r = rand;

disp(r)

% fprintf
a = rand;
b = 'abc';
fprintf('the value of a is %f.  the value of b is %s\n',a,b);
% numbers:  %-10.6f
% string:   %10s
% special characters:  \n  \t  \\  %%  ''

% vectorized fprintf
a = rand(1,3);
fprintf('the random numbers are %.2f, %.2f, and %.2f\n',a);

%% write some text to a file

% open the file
fid = fopen('testfile.txt','w');
% to append to an existing file, use 'a' instead of 'w'

% write a line to the file
fprintf(fid,'%% %s\n',datestr(now));
% *** sometimes Windows needs \r\n instead of \n

% write some more lines to the file
for i = 1:10
    fprintf(fid,'%.0f\t%2.0f\t%.9f\n',i,round(100*rand),now);
end

% close the file
fclose(fid);

% read the file into the workspace
d = load('testfile.txt','-ascii');


%% saving variables

a = rand;
b = rand;
c = rand;

% .mat files
save mydata.mat a
save mydata.mat b -append
save mydata.mat

clear
load mydata.mat

% .txt files
a = rand(3,5);
save mydata.txt a -ascii
clear
r = load('mydata.txt');


%% switch

% switch
switch quiz
	case 10
		grade = 1;
	case { 8, 9 }
		grade = 2;
	case 7
		grade = 3;
	otherwise
		grade = 4;
end

%% warnings and errors
% can be inserted into scripts and functions to tell your user 
% (or yourself) about potential problems or errors

warning('subject %s: the file exists but it is empty, so new data file written', cur_sub);

if size(trials,1) < 240
    error('subject %s: too few trials!', cur_sub)
else
end

if size(trials,2) < 10
    error('subject %s: too few parameters - file corrupted?',cur_sub)
else
end