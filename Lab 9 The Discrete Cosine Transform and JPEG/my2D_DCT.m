function [DCT] = my2D_DCT(x)

N = length(x);
DCT = zeros(N,N);

for m = 0:N-1
    for n = 0:N-1
        [discrete_cosine] = discrete_cosine2D(m,n,N);
        DCT(m+1,n+1) = inner2D(x,(discrete_cosine));
    end
end

end