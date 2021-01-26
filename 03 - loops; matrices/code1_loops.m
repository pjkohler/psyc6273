%% code1_loops.m  Demonstration code for loops


%% for loop
% counted loop,repeats statements a specified number of times

% for loop that doesn't use the loop variable
for i = 1:5
    fprintf('this is a pass through the loop\n');
end

% press control-c to end a loop before it's done

% for loop that uses the loop variable
for a = 1:5
    fprintf('this is pass %d through the loop\n',a);
end

% for loop to calculate the sum of a sequence of numbers
k = 0;
for i = 1:10
    k = k + i;
    fprintf('k = %.0f\n',k);
end

% preallocate, then get several random numbers
v = NaN(100,1);
for i = 1:100
    v(i) = rand;
end
% of course, it would be easier to just say v = rand(100,1);

% if statement inside a loop; list primes between 1 and 100
for k = 1:100
    
    if isprime(k)
        fprintf('%d\n',k);
    end
    
end

% nested for loops
r = zeros(10,10);
for i = 1:10
    
    for j = 1:10
        r(i,j) = rand;
    end
    
end
% of course, it would be easier to just say r = rand(10,10);

% list all pairs of numbers up to n
n = 20;
p = [];
for i = 1:n
    
    for j = i:n
        p(end+1,:) = [ i j ];
    end
    
end
% better:  initialize p ahead of time

% breaking out of a loop; find first prime between m and n
m = 300;
n = 400;
p = NaN;
for i = m:n
    
    if isprime(i)
        p = i;
        break
    end
    
end

% continuing a loop; print non-primes between 1 and 100
for i = 1:100
    
    if isprime(i)
        continue
    end
    fprintf('%d\n',i);
    
end


%% while loop
% conditional loop: will loop until a condition is met

% find the first factorial greater than some number
m = 2000;
i = 1;
while factorial(i)<m
    i = i + 1;
end
fprintf('the first factorial greater than %d is %d! = %d\n',m,i,factorial(i));

% can also use break and continue in a while loop


%% vectorized code

% note!  we usually don't loop over elements in vectors and matrices

% version 1
for i = 1:numel(v)
    v(i) = 3*v(i);
end

% version 2 (easier to read and maintain, often faster)
v = 3 * v;


% version 1
runprod = 1;
for i = 1:n
    runprod = runprod * i;
end

% version 2 (easier to read and maintain, often faster)
runprod = prod(1:n);


%% exercises

% chapter 5, exercises 1, 5, 16, 29, 32
