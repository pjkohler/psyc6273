function sine = assign_cart(sine)
    % assign_cart: converts phase and amplitude fields in a struct 
    %              into cartesian coordinates and returns the same struct. 
    %              note: works for individual struct or array of structs
    %
    % 
    % sine = assign_cart(sine)

    phase_rad = [sine.phase] .* pi/180;  % convert to radians
    [ x, y ] = pol2cart(phase_rad, [sine.amplitude] ); % convert to cartesian coordinates
    % full disclosure, there might be a better way to assign these values!
    for z = 1:length(x)
        sine(z).x = x(z);
        sine(z).y = y(z);
    end
end
