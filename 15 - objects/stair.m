classdef stair < handle

    % STAIR  Up-down transformed response (UDTR) staircase class
    % 
    % methods:
    % 
    %   obj = stair( stim, updown )     constructor
    %     s = stim                      get current stimulus level
    %         resp( correctflag )       report correct or incorrect response
    %         reset                     reset number of correct and incorrect trials to zero
    
    properties
        
        stimlist               % list of stimulus levels
        stimi                  % index of current stimulus level
        correctk, incorrectk   % current number of correct and incorrect trial results
        upn, downn             % thresholds for increasing and decreasing stimulus level
        
    end
    
    methods
        
        % constructor
        function obj = stair( stim, updown )

            % record list of stimulus levels
            obj.stimlist = stim;
            
            % record criteria for increasing and decreasing stimulus level
            obj.upn = updown( 1 );
            obj.downn = updown( 2 );
            
            % initialize stimulus level
            obj.stimi = round( numel( obj.stimlist ) / 2 );
            
            % initialize number of correct and incorrect responses to zero
            obj.reset;
            
        end
        
        % get current stimulus level
        function s = stim( obj )
            s = obj.stimlist( obj.stimi );
        end
        
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
                
                % reset number of correct and incorrect trials to zero
                obj.reset;
                
                return
                
            end
            
            % enough correct trials to decrease stimulus level?
            if obj.correctk >= obj.downn
                
                % increase stimulus level; but don't go below start of
                % stimulus list
                obj.stimi = max( obj.stimi-1, 1 );
                
                % reset number of correct and incorrect trials to zero
                obj.reset;
                
                return
                
            end
            
        end

        % set number of correct and incorrect trials to zero
        function reset( obj )
            obj.correctk = 0;
            obj.incorrectk = 0;
        end
        
    end
    
end
