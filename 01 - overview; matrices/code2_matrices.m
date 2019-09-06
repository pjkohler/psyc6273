%% code2_matrices.m  Demonstration code for matrices


%% how to create matrices

% - a matrix is an m x n grid of elements
% - same number of entries in each row and column
% - many uses for matrices:  trial-by-trial data, images, etc.
% - related terms:  row vector (1 x m), column vector (n x 1), scalar (1 x 1)

a = [ 1 2 3 ; 4 5 6 ]   % enter values manually
a = [ 1 ; 2 ; 3 ]
a = 1:10                % sequence
a = 1:2:10              % sequence
a = linspace(1,5,20)    % sequence
a = zeros(3,5)          % matrix of zeros
a = ones(3,5)           % matrix of ones
a = rand(3,5)           % uniform random values
a = randn(3,5)          % normal random values
a = [];                 % empty matrix
a = rand(3,3,2)         % three dimensional matrix

a = [ 4 8 9 ];
b = [ 2 3 ];
c = [ a b ]   % combine matrices to form a new matrix


%% mathematical operations on matrices

a = rand(3);
b = 3 * a        % scalar multiplication
c = a + b        % matrix addition
c = a * b        % matrix multiplication
c = a .* b       % pointwise multiplication; also a./b, a.^b
c = 10 * a + 3   % scalar multiplication and addition



%% matrix related functions

a = rand(3,5);
dim = size(a)
[m,n] = size(a)
k = numel(a)
b = reshape(a,[ 1 15 ])
b = repmat(a,[ 2 3 ])


%% subscript indices

a = rand(5);
b = a(1,2)          % get an element using subscripts
b = a(1,[ 2 3 4 ])  % get multiple elements using multiple subscripts
b = a(1,2:4)        % get multiple elements using a range
b = a(1,:)          % get a whole row
b = a(1,3:end)      % get the last part of a row
b = a(1:2,2:4)      % get a submatrix

a(1,[ 2 3 4 ]) = 0  % any of the above can also appear on the left side of
                    % an equation, in which case new values are assigned to
                    % those elements


%% exercises

% chapter 2, exercises 5, 6, 10, 12, 13, 18, 26, 27, 30, 40
