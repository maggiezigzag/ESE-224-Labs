% Lab 5 Part 2
%% 2.2 Subsampling function.

sigma = .0001; % s (100 ms) (test for 100ms, 10ms, 1ms, 0.5ms, 0.1ms, 0.05ms)
mu = 1; % s
fs = 40000; % Hz
fss = 4000; % Hz
T = 2; % s
Ts = 1/fs;
Tss = 1/fss;
t = 0:1/fs:T-1/fs;
t2 = 0:1/fss:T-1/fss;

% Generating gaussian pulse
x = gaussmf(t,[sigma mu]);

[xs, xd] = subsample(x,Ts,Tss);

stem(t2,xs);title('Subsampled Gaussian Pulse');xlabel('Time increments');ylabel('Signal value');figure;stem(t,xd);title('Dirac Train of Gaussian Pulse');xlabel('Time increments');ylabel('Signal value');

%% 2.3 Spectrum periodizing

[xs, xd] = subsample(x,Ts,Tss);

[f,X,~,~]=dft(x,fs);
X = circshift(X,[length(X)/2,0]);
[fd,Xd,~,~]=dft(xd,fs);

figure;plot(f,abs(X));title('DFT of Gaussian Pulse');xlabel('Frequency');ylabel('DFT value');figure;plot(fd,abs(Xd));title('DFT of Dirac Train of Gaussian Pulse');xlabel('Frequency');ylabel('DFT value');

%% 2.5 Spectrum periodizing with prefiltering

[xs_lpf, xd_lpf] = subsample_lpf(x,Ts,Tss);

[f,X,~,~]=dft(x,fs);
X = circshift(X,[length(X)/2,0]);
[fd,Xd,~,~]=dft(xd_lpf,fs);

figure;plot(f,abs(X));title('DFT of Gaussian Pulse');xlabel('Frequency');ylabel('DFT value');figure;plot(fd,abs(Xd));title('DFT of Dirac Train of Gaussian Pulse');xlabel('Frequency');ylabel('DFT value');

%% 2.6 Reconstruction function

reconstructed_signal = reconstruction(xs,fs,fss);
reconstructed_signal_lpf = reconstruction(xs_lpf,fs,fss);
figure;stem(t2,reconstructed_signal);title('Reconstructed Sampled Gaussian Pulse');xlabel('Time increments');ylabel('Signal value');figure;stem(t2,reconstructed_signal_lpf);title('Reconstructed LPF Sampled Gaussian Signal');xlabel('Time increments');ylabel('Signal value');
