function [xs, xd] = subsample_lpf(x,Ts,Tss)

fs = 1/Ts;
fss = 1/Tss;

% Taking LPF over dft of signal
[~,X,~,~]=dft(x,fs);
X=lpf_freq(X,fss/2,fs);
[~,x]=idft(X,fs);
x=real(x);

% Ratio for sampling and subsampling
ratio = fs/fss;

% Subsampling
xs = downsample(x,ratio);

% Delta train representation
xd = upsample(xs,ratio);
xd = xd(1:length(x));

end

