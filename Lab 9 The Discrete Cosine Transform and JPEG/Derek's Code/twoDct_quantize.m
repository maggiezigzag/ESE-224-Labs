function mat = twoDct_quantize(x, Ks)
    Q = [16 11 10 16 24 40 51 61; 12 12 14 19 26 58 60 55; 14 13 16 24 40 57 69 56; ...
    14 17 22 29 51 87 80 62; 18 22 37 56 68 109 103 77; 24 36 55 64 81 104 113 92; ...
    49 64 78 87 103 121 120 101; 72 92 95 98 112 100 103 99];
    [N,~] = size(x);
    mat = [];
    for a = 1:8:N-7
        col = [];
        for b = 1:8:N-7
            %X = zeros(8);
            sec = x(b:(b+7),a:(a+7));
            press = twoD_DCT(sec);
            [A, I] = sort(abs(press(:)), 'descend');
            maxK_value = abs(A(Ks));
            X = press .* (abs(press) >= maxK_value);
            X = round(X ./ Q);
            X = X .* Q;
            %X(I(1:Ks)) = press(I(1:Ks));
            %[iDCT] = my2DiDCT(X);
            iDCT = twoD_iDCT(X);
            col = vertcat(col, iDCT);
        end
        mat = horzcat(mat, col);
    end
end