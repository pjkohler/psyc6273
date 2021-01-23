function icecream(ice_type)
    % function for evaluating ice cream
    switch ice_type
    case 'chocolate'
        fprintf('\n%s tastes bad\n', ice_type)
    case 'vanilla'
        fprintf('\n%s tastes good\n', ice_type)
    case 'strawberry'
        fprintf('\n%s tastes great\n', ice_type)
    otherwise
        fprintf('\nhm ... not so sure about %s \n', ice_type)
    end
end

