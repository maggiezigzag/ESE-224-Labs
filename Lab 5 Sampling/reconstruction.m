function xd = reconstruction(xs,Ts,Tss)

%Low pass filter the DFT of x_delta using lpf_freq() and use idft() 
%for reconstruction on the output of the LPF.

fs = 1/Ts;
fss = 1/Tss;

% Taking LPF over dft of signal
[~,X,~,~] = dft(xs,fs);
X = lpf_freq(X,fss/2,fs);

% Reconstructing signal using idft
[~,x] = idft(X,fs);
xd = real(x);

end