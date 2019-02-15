function mat = twoDct_compression(x, Ks)
    [N,~] = size(x);
    mat = [];
    for a = 1:8:N-7
        col = [];
        for b = 1:8:N-7
            sec = x(b:(b+7),a:(a+7));
            press = twoD_DCT(sec);
            [A, I] = sort(abs(press(:)), 'descend');
            maxK_value = abs(A(Ks));
            X = press .* (abs(press) >= maxK_value);
            iDCT = twoD_iDCT(X);
            col = vertcat(col, iDCT);
        end
        mat = horzcat(mat, col);
    end
end