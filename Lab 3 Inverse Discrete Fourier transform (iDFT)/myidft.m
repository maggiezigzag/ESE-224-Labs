function [t,iDFT] = myidft(firsthalf,fs)

% Since only given DFT coefficients up to k = N/2, must reconstruct other
% half
N=(length(firsthalf)-1)*2; 

% Second half is simply first half but flipped
secondhalf = flipud(firsthalf(2:N/2));

% Full DFT is first half concatenated with conjugate of second half
fullDFT = [firsthalf;conj(secondhalf)];

% Vector for iDFT
iDFT=zeros(N,1); 

for n = 1:N
    for k = 1:N
    iDFT(n) = iDFT(n)+fullDFT(k)*exp(1i*2*pi*(k-1)*(n-1)/(N));
    end 
end 

iDFT = iDFT./sqrt(N);

% Time vector
T=N/fs;
t=(0:1/fs:T-1/fs)';

end