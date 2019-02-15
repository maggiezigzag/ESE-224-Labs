function ret = twoD_inner(a, b)
    ret = 0;
    [x, y] = size(a);
    for k = 1:x
        for l = 1:y
            ret = ret + a(k,l)*conj(b(k,l));
        end
    end
end