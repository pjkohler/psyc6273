function o = test_remain( a, b )
    if ( a > 0 ) && ( b > 0 )
        o = rem(a, b);
    else
        o = NaN;
    end
end
