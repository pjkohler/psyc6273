function out = test_randomize( in )
    idx = randperm(numel(in));
    out = reshape(in(idx), size(in));
end
