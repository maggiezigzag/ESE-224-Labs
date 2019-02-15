function mat = twoD_iDFT(X)
    [x, ~] = size(X);
    mat = zeros(x);
    for j = 1:x
        for k = 1:x
            [Y, ~, ~] = compex_mat((j-1),(k-1),x);
            mat(j, k) = twoD_inner(X, Y);
        end
    end
end