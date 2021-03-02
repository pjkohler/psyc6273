%% datastruct.m  Demonstration code for data structures
% data structure = 
% variable that stores more than one value 
% and more than one type of value

%% cell arrays

% creating cell arrays
c = { 23 'a' ; 1:2:9 'hello' }
class(c)

% properties of cell arrays
size(c)
numel(c)

% elements of cell arrays are cells, i.e., 1 x 1 cell arrays

% can refer to cells or to contents of cells
a = c{1,2}      % content indexing:  here, returns a string
class(a)
a = c(1,2)      % cell indexing:  returns a 1 x 1 cell
class(a)

d = c{1,:}      % returns a comma separated list
[a,b] = c{1,:}  % stores values in a and b
d = c(1:2)      % returns a 1 x 2 cell array

% can use the usual subscripting methods
d = c(1,:)      % first row, all columns
d = c{1,end}    % first row, last column
c(2,:) = []     % deletes row 2


%% structs
% very good way of storing information

% two ways of creating a struct:

% creating a struct
sine1.wavelength = 32;
sine1.amplitude = 0.5;
sine1.phase = 90;

% creating a struct
sine2 = struct('wavelength',16,'amplitude',0.25,'phase',0);

% structs are useful for gathering together related information,
% and passing this information to functions
                          
% copying and modifying structs
sine3 = sine1;
sine3.phase = 180;

% functions for structs
isstruct( sine1 )                      % is it a struct?
fieldnames( sine1 )                    % list field names
isfield( sine1, 'velocity' )           % is it a field of this struct?
sine1 = rmfield( sine1, 'amplitude' )  % remove a field

% struct array
sine(1).wavelength = 32;
sine(1).amplitude = 0.5;
sine(1).phase = 90;
sine(2).wavelength = 16;
sine(2).amplitude = 0.25;
sine(2).phase = 0;

% struct array
for i = 1:10
    sine(i).wavelength = 10 + 10*rand;
    sine(i).amplitude = rand;
    sine(i).phase = 360*rand;
end

% getting field values from a vector of structs
sine.amplitude          % returns a comma separated list
[ sine.amplitude ]      % returns a vector
sum([ sine.amplitude ])

% use function to populate struct, and return the same struct!
sine = assign_cart(sine);

% note: works equally way with single structs and arrays of structs
sine2 = assign_cart(sine2);

% this is object-oriented programming!

%% tables
% very good way of inspecting / viewing data information

% generate table manually
sine_table = table([sine.wavelength]', [sine.amplitude]', [sine.phase]', 'VariableNames', {'wavelength', 'amplitude', 'phase'});

% however, tables can also be generated directly from structs
sine_table2 = struct2table(sine);

% and tables can be written directly to csv files
writetable(tbl, '~/Desktop/sine_test.csv', 'Delimiter',',','QuoteStrings',true);

% cell2table
c = { 23 'a' ; 1:2:9 'hello' }
cell_table = cell2table(c); 

% convert cell to struct:
cell_struct = cell2struct(c, {'cat1', 'cat2'}, 2);
% also possible to go the other way: struct2cell

%% exercises

% chapter 8, exercises 1, 5, 14, 24, 25
