function sorted = bubblesort( unsorted )

% BUBBLESORT  Sort a matrix using the bubblesort algorithm
% 
% usage:  sorted = bubblesort( unsorted )

% initialize return argument
sorted = unsorted;

% loop until sorted
flipped = 1;
while flipped
    
    % nothing flipped so far on this pass
    flipped = 0;
    
    % check elements pairwise
    for i = 1:numel( sorted )-1
        
        % in wrong order?
        if sorted(i) > sorted(i+1)
            
            % flip order
            sorted([ i i+1 ]) = sorted([ i+1 i ]);
            
            % record that we have flipped a pair on this pass
            flipped = 1;
            
        end
        
    end
    
end

end
