% Given coefficients of DFT corresponding to k = 0, 1, ...N/2 and fs:
%sampling freq`
function [iDFT, times] = comp_iDFT(DFT_1, fs)
N = (length(DFT_1)-1)*2; % length of signal
DFT_2 = flipud(DFT_1(2:N/2)); % from N/2 to N -1
DFT_whole = [DFT_1; conj(DFT_2)]; % DFT for 0 to N-1
iDFT = zeros(N,1); % iDFT from 0 to N-1
for n = 1:N % indexing of iDFT
for k = 1:N %indexing of DFT_whole (freq are k-1)
iDFT(n)= iDFT(n)+1/sqrt(N)*(DFT_whole(k)*exp(j*2*pi*(k-1)*(n-1)/N));
end
end
times = (0:N-1)/fs;
end