% trackit_plot.m  Plot results of tracking experiment

% load data
load trackit.mat

% make time bins
tbin = linspace( 0, 10, 100 );

% initialize matrices for finding mean error
err  = zeros( size( tbin ) );
errn = zeros( size( tbin ) );

% find average error in each bin
for t = 1:numel( trial )
    
    % assign times to bins
    [~,~,bin] = histcounts( trial(t).time, tbin );
    
    % add corresponding errors to bins
    for i = 1:numel( err )
        err(i)   = err(i)  + sum(   trial(t).error( bin==i ) );
        errn(i)  = errn(i) + numel( trial(t).error( bin==i ) );
    end
    
end
err = err ./ errn;

% plot results
plot( tbin, err, 'r-' );
xlabel 'time (seconds)'
ylabel 'mean tracking error (pixels)'
