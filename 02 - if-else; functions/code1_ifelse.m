%% code1_ifelse.m  Demonstration code for if-else statements


%% if-elseif-else

% ask the user to enter a number between 0 and 1
num = input('enter a number between 0 and 1:  ');

% if statement
if num < 0
	x = 0;
end

% if-else
if num < 0
	x = -1;
else
	x = 1;
end

% if-elseif-else
if num < -10
	x = -2;
elseif num < 0
    x = -1;
elseif num == 0  % use == to test for equality (not =)
    x = 0;
elseif num <= 10
    x = 1;
else
    x = 2;
end

% nested if-else
if num < 0
    
    if num < -5
        x = -2;
    else
        x = -1;
    end
    
else
    x = 1;
end

% logical operations
%   && = and
%   || = or
%   ~  = not
a = rand;
b = rand;
if ( a>0.5 && b>0.5 ) || ~( a>0.9 )
	x = 0;
end

% use || && ~ for if-elseif-else (also switch and while)

% use |  &  ~ for matrix operations (logical indices); will cover these later


%% exercises

% chapter 4, exercises 11, 14, 16, 20
