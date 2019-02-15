function [t,xk] = sig_reconstruct_k(Kcoeff,f,fs,N)

xk=zeros(1,N); % initialize an array of same size as that of input sequence
K = length(Kcoeff);

for n=1:N
    for k=1:K % Reconstructs frequencies up to K
        xk(n)=xk(n)+(Kcoeff(k)*exp(1i*2*pi*f(k)*(n-1)/N));
    end
end

xk=xk./sqrt(N);

% time vector
T=N/fs;
t=(0:1/fs:T-1/fs);

end