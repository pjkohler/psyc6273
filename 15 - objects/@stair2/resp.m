% update staircase with result of a trial
function resp( obj, correct )

% increment number of correct or incorrect trials
if correct
    obj.correctk = obj.correctk + 1;
else
    obj.incorrectk = obj.incorrectk + 1;
end

% enough incorrect trials to increase stimulus level?
if obj.incorrectk >= obj.upn
    
    % increase stimulus level; but don't go beyond end of
    % stimulus list
    obj.stimi = min( obj.stimi+1, numel( obj.stimlist ) );
    
    % reset number of correct and incorrect trials
    obj.correctk = 0;
    obj.incorrectk = 0;
    
    return
    
end

% enough correct trials to decrease stimulus level?
if obj.correctk >= obj.downn
    
    % increase stimulus level; but don't go below start of
    % stimulus list
    obj.stimi = max( obj.stimi-1, 1 );
    
    % reset number of correct and incorrect trials
    obj.correctk = 0;
    obj.incorrectk = 0;
    
    return
    
end

end
