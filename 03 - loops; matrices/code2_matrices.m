%% code2_matrices.m  More demonstration code on matrices


%% more on creating matrices

a = nan( 3, 5 )            % not a number
a = inf( 3, 5 )            % infinite value

a = [ 10 20 30
40 50 60 ]


%% more mathematical operations on matrices

a = rand( 3 );
c = sin( a )      % pass a matrix to a mathematical function, get a matrix back
c = inv( a )      % matrix inverse
c = a'            % matrix transpose

min( a )          % minimum of each column, or of a row vector
min( a, [], 1 )   % minimum of each column
min( a, [], 2 )   % minimum of each row

min( min( a ) )   % minimum of a whole m x n matrix
min( a(:) )       % minimum of a whole matrix

max( a )          % maximum of each column, or of a row vector
max( a, [], 1 )   % maximum of each column
max( a, [], 2 )   % maximum of each row

sum( a )          % sum of each column, or of a row vector
sum( a, 1 )       % sum of each column
sum( a, 2 )       % sum of each row

prod( a )         % product of each column, or of a row vector
prod( a, 1 )      % product of each column
prod( a, 2 )      % product of each row


%% more matrix related functions

a = rand( 3, 5 );
b = length( a )
b = fliplr( a )
b = flipud( a )
b = rot90( a, 1 )


%% more on subscript indices

a = rand( 5 );
b = a( 1, end-1 )     % use 'end-1' to get the second last element in a row
b = a( : )            % convert a to a column vector

a = rand( 1, 10 );
a( 3 ) = []           % delete an element
a( 1:3 ) = []         % delete several elements


%% logical indices

a = rand( 3 );
b = a > 0.5          % get a matrix of ones and zeros that indicate which
                     % elements meet some criterion

k = sum( b(: ))      % count the elements that meet the criterion
k = sum( a(:) > 0.5 )  % same thing, more concisely
                
c = a( b )           % get the elements that meet the criterion

a( b ) = 0           % set the elements that meet the criterion to some value
a( a > 0.5 ) = 0     % same thing, more concisely

x = rand( 5 );       % get some random numbers
y = rand( 5 );       % get some random numbers
sum( x( y>0 ) )      % get the sum of all x's where the corresponding y's meet a criterion
                     % (useful in data analysis, e.g., find mean reaction
                     %  over all trials where stimulus was type A)

e = any( b(:) )      % see if any elements meet the criterion
f = all( b(:) )      % see if all elements meet the criterion

% logical operators
g = a>0.1 & a<0.2
g = ( a>0.1 & a<0.2 ) | ~( a<0.95 )

% logical indices must be type 'logical'


%% linear indices

% column major order

a = rand(5);
b = a(1)            % get an element using linear indices
b = a([ 1 2 3 ])    % get multple elements using multiple indices
b = a(1:5)          % use a range
b = a(6:end)        % use 'end'
b = a(:)            % convert to column vector

f = find(a>0.5)     % get the indices for the entries that meet some criterion
b = a(f)            % get the entries that meet the criterion

f = find( ( a>-1 | a<1 ) & ~abs(a)<0.01 )    % more complex criteria
b = a(f)            % get the entries that meet the criterion

a([ 1 2 3 ]) = 0    % any of the above can appear on the left side
f = find(a>0.5);
a(f) = 0            

a([ 1 2 3 ]) = [ 10 20 30 ]  % can assign multiple values


%% exercises

% chapter 2, exercises 41, 45, 47
