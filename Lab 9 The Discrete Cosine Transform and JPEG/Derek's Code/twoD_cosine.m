function mat = twoD_cosine(k, l, N)
    mat = zeros(N);
    for a = 1:N
        for b = 1:N
           mat(a, b) = 2/sqrt(N^2)*...
               cos(((k*pi)/(2*N))*(2*(a-1) + 1))*...
               cos(((l*pi)/(2*N))*(2*(b-1) + 1));
        end
    end
end