function [fk,X] = my2Ddft(x,fs)
N = length(x);

X = zeros(N);

for k = 1:N
    for l = 1:N
        [complex_e, ~, ~] = complex_e2D(k-1,l-1,N);
        X(k,l) = inner2D(x,complex_e);       
    end
end

X = circshift(X,ceil(N/2)-1); 
fk=(-ceil(N/2-1):floor(N/2))'/fs;
fk = repmat(fk,[1,N]);

end