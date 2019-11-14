function [ key, presstime ] = getkey

% GETKEY  Wait for user to press 1, 2, or q
% 
% usage:  [ key, presstime ] = getkey

% loop
while 1
    
    % check keyboard
    [ down, presstime, code ] = KbCheck;

    % did they press a key?
    if down
        
        % decode key
        key = KbName(code);
        
        % see if it's a keypress that we're looking for
        if any( strcmp( key, '1' ) ) || any( strcmp( key, '1!' ) )
            key = 1;
            return
        elseif any( strcmp( key, '2' ) ) || any( strcmp( key, '2@' ) )
            key = 2;
            return
        elseif any( strcmpi( key, 'q' ) )
            key = NaN;
            return
        end
        
    end
    
end

end
