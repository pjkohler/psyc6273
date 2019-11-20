%% string_demo.m  Demonstration code for strings

% - strings are vectors; they have zero or more characters
% - overview of strings:  help strings


%% creating strings

s = 'cat'                                    % quotation marks
s = sprintf('the value of pi is %.3f\n',pi)  % sprintf
s = input('enter a string:  ','s')           % input
s = blanks(5)                                % blanks


%% using matrix operations on strings

s = 'cat';
s(1)
s(1:2)
s'
s = [ 'hello' ; 'there' ]
s = [ 'bird' 'house' ]
size(s)
length(s)


%% using strings

% modifying strings
s = '  cat  ';
t = deblank(s)      % removes trailing blanks
t = strtrim(s)      % removes leading and trailing blanks
t = upper(s)        % upper case; also lower()

% comparing strings
s = 'this';
t = 'that';
b = strcmp(s,t)      % are they the same?
b = strcmpi(s,t)     % are they the same, ignoring case differences?
b = strncmp(s,t,2)   % are the first two characters the same?

% categories of characters
b = isletter(s(1))
b = isspace(s(1))
b = ischar(s)

% finding and using substrings
k = strfind('birdhouse','hou')        % find beginning of a substring; can find multiple occurrences
s = strrep('birdhouse','bird','dog')  % replace one substring with another
[ tok, rest ] = strtok( 'divide this sentence into words', ' ' )  % find a token delimited by one or more characters

% evaluate a string as a matlab command
eval('x = 3;');

% convert a string to a number
n = str2double('3.14')
n = str2num('[ 1 2 pi ]')

% convert a string to the numbers that represent it
n = double('a')
n = double('abc')


%% exercises

% chapter 7, exercises 6, 10, 15, 25

