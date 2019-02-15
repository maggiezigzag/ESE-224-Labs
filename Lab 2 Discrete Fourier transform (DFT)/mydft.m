function [fk,X] = mydft(x,fs)

N = length(x);

X=zeros(N,1);
for k=0:N-1 
    for n=0:N-1 
 		X(k+1)=X(k+1)+1/sqrt(N)*x(n+1)*exp(-1i*2*pi*k*n/N);
    end
end

X = circshift(X,ceil(N/2)-1); 
fk=(-ceil(N/2-1):floor(N/2))'/fs;

end