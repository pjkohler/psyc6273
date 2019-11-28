classdef stair2 < handle
    
    properties
        
        stimlist               % list of stimulus levels
        stimi                  % index of current stimulus level
        correctk, incorrectk   % current number of correct and incorrect trial results
        upn, downn             % thresholds for increasing and decreasing stimulus level
        
    end
    
    methods
        
        % constructor
        function obj = stair2( stim, updown )

            % record list of stimulus levels
            obj.stimlist = stim;
            
            % record criteria for increasing and decreasing stimulus level
            obj.upn = updown( 1 );
            obj.downn = updown( 2 );
            
            % initialize stimulus level
            obj.stimi = round( numel( obj.stimlist ) / 2 );
            
            % initialize number of correct and incorrect responses
            obj.correctk = 0;
            obj.incorrectk = 0;
            
        end
        
    end
    
end
