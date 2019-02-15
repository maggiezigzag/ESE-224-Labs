function [discrete_cosine] = discrete_cosine2D(k,l,N)

discrete_cosine = zeros(N,N);

for n = 1:N
    for m = 1:N
        discrete_cosine(m,n)=cos(((k*pi)/(2*N))*(2*m+1))+cos(((l*pi)/(2*N))*(2*n+1));
    end
end

end