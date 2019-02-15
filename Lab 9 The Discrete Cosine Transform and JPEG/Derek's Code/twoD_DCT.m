function y = twoD_DCT(x)
    [N,~] = size(x);
    y = zeros(N);
    for m = 1:N
        for n = 1:N
            if m == 1 && n == 1
                mat = (1/2)*twoD_cosine(m - 1, n - 1, N);
                %y(m,n) = twoD_inner(x, mat);
                y(m,n) = sum(sum(x.*mat));
            elseif m == 1
                mat = (1/sqrt(2))*twoD_cosine(m - 1, n - 1, N);
                %y(m,n) = twoD_inner(x, mat);
                y(m,n) = sum(sum(x.*mat));
            elseif n == 1
                mat = (1/sqrt(2))*twoD_cosine(m - 1, n - 1, N);
                %y(m,n) = twoD_inner(x, mat);
                y(m,n) = sum(sum(x.*mat));
            else
                mat = twoD_cosine(m - 1, n - 1, N);
                %y(m,n) = twoD_inner(x, mat);
                y(m,n) = sum(sum(x.*mat));
            end
        end
    end
end