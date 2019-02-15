function mat = twoD_compression(x, Ks)
    [N,~] = size(x);
    mat = [];
    for a = 1:8:N
        col = [];
        for b = 1:8:N
            X = zeros(8);
            sec = x(b:(b+7),a:(a+7));
            press = fft2(sec);
            [A, I] = sort(abs(press(:)), 'descend');
            X(I(1:Ks)) = press(I(1:Ks));
            rec = ifft2(X);
            col = vertcat(col, rec);
        end
        mat = horzcat(mat, col);
    end
end