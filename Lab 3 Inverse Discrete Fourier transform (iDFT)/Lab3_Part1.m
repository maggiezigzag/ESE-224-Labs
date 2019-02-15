% Lab 3 Part 1

%% 1.3 Reconstruction of a square pulse.

% Given values
T0 = 2;
T = 32;
fs = 8;
N = T*fs;

% Generating the square pulse using given conditions
[t,squarePulse]=sqpulse(T0,T,fs);

% Plotting the square pulse
plot(t,squarePulse)
xlabel('Time (seconds)')
ylabel('Amplitude')
title('Original Square Pulse')

% Generating the DFT of the square pulse
[~,X,f_c,X_c]=dft(squarePulse,fs);
energy_DFT = dot(X,X); % energy of total DFT

% Generating the iDFT of the square pulse 
[t,squareiDFT] = idft(X,fs); %x

%Plotting the iDFT of the square pulse
figure
plot(t,squareiDFT);
ylim([0 0.18]);
xlabel('Time (seconds)')
ylabel('Amplitude')
title('iDFT of Square Pulse')

% Reconstructing the square pulse
[~,xk2] = sig_reconstruct(X(1:3),fs,N); % K = 2
diff2 = squarePulse-xk2;
energyDiff2 = dot(diff2,diff2);

[~,xk4] = sig_reconstruct(X(1:5),fs,N); % K = 4
diff4 = squarePulse-xk4;
energyDiff4 = dot(diff4,diff4);

[~,xk8] = sig_reconstruct(X(1:9),fs,N); % K = 8
diff8 = squarePulse-xk8;
energyDiff8 = dot(diff8,diff8);

[~,xk16] = sig_reconstruct(X(1:17),fs,N); % K = 16
diff16 = squarePulse-xk16;
energyDiff16 = dot(diff16,diff16);

[t,xk32] = sig_reconstruct(X(1:33),fs,N); % K = 32
diff32 = squarePulse-xk32;
energyDiff32 = dot(diff32,diff32);

% Plotting the reconstructed square pulse
figure
plot(t,xk2);
xlabel('Time (seconds)')
ylabel('Amplitude')
title('Reconstructed Square Pulse')

%% 1.4 Reconstruction of a triangular pulse.

% Given values
T0 = 2;
T = 32;
fs = 8;
N = T*fs;

% Generating triangular pulse
[t,triPulse]=tripulse(T0,T,fs);

% Plotting the triangle pulse
plot(t,triPulse);
xlabel('Time (seconds)')
ylabel('Amplitude')
title('Original Triangle Pulse')

% Generating the DFT of the triangle pulse
[~,X,~,~]=dft(triPulse,fs);

% Generating iDFT of the triangle pulse
[t,triangleiDFT] = idft(X,fs); %x

% Plotting the iDFT of the triangle pulse
figure
plot(t,triangleiDFT);
xlabel('Time (seconds)')
ylabel('Amplitude')
title('iDFT of Triangle Pulse')
ylim([0 0.45])

% Reconstructing the square pulse
[~,xk2] = sig_reconstruct(X(1:3),fs,N); % K = 2
diff2 = triPulse-xk2;
energyDiff2 = dot(diff2,diff2);

[~,xk4] = sig_reconstruct(X(1:5),fs,N); % K = 4
diff4 = triPulse-xk4;
energyDiff4 = dot(diff4,diff4);

[~,xk8] = sig_reconstruct(X(1:9),fs,N); % K = 8
diff8 = triPulse-xk8;
energyDiff8 = dot(diff8,diff8);

[~,xk16] = sig_reconstruct(X(1:17),fs,N); % K = 16
diff16 = triPulse-xk16;
energyDiff16 = dot(diff16,diff16);

[t,xk32] = sig_reconstruct(X(1:33),fs,N); % K = 32
diff32 = triPulse-xk32;
energyDiff32 = dot(diff32,diff32);

% Plotting the reconstructed triangle pulse
figure
plot(t,xk2);
xlabel('Time (seconds)')
ylabel('Amplitude')
title('Reconstructed Triangle Pulse')

%% 1.5 The energy of the difference signal.

% Given values
T0 = 2;
T = 32;
fs = 8;
N = T*fs;

% Generating triangular pulse
[t,triPulse]=tripulse(T0,T,fs);
% Generating the DFT of the triangle pulse
[~,X,~,~]=dft(triPulse,fs);
energyDFT = dot(X,X); % energy of DFT
% Creating successive reconstructions of triangle pulse
[t,xk] = sig_reconstruct(X(1:3),fs,N);
diff2 = triPulse - xk;
energyDiff2 = dot(diff2,diff2);
energyDiff2_no = energyDFT - dot(xk,xk);
energyDiff_everythingelse = dot(X(4:length(X)),X(4:length(X)));

%% 1.6 Signal compression.

% See sig_compression.m

%% 1.7 The why of signal compression 

% The error signal is the difference between the compressed version and the
% original: e(n) = x(n)?x~k(n). 
% The idea in compression is that if N is the number of DFT coefficients,
% and we want to use only K < N of them, then we select the M largest (in magnitude) coefficients?so the size of the set A is M, where
% A consists of the M largest DFT coefficients. Such a compression scheme minimizes the error energy
% ||e||2 = ? N?1, n=0 |e(n)|^2.
% 
% "A much better technique is to use the k largest coefficients of each time
% series, because they preserve the optimal amount of energy per time series
% [31]. Better energy preservation means, that a prototype, reconstructed using
% the extracted features, will be more similar to the original signal with
% respect to the Euclidean distance. Thus it also will preserve the Euclidean
% distance between two time series better, an important property for data mining."
% -- Moerchen, et.al.

%% 1.8 Signal reconstruction. 

% See sig_reconstruct_k

T0 = 4;
T = 32;
fs = 8;
K = 32; % K changes manually
N = T*fs;

% Generating the square pulse using given conditions
[t,squarePulse]=sqpulse(T0,T,fs);
plot(t,squarePulse)

[f,Kcoeff] = sig_compression(K,squarePulse,fs);
[t,xk] = sig_reconstruct_k(Kcoeff,f,fs,N);
figure
plot(t,xk)

%% 1.9 Compression and reconstruction of a square wave.

% Generate a square wave of duration T = 32s sampled at a rate fs = 8Hz and frequency
% 0.25Hz. Compress and reconstruct this wave using the functions
% in parts 1.6 and 1.8. Try different compression targets and report the energy
% of the error signal for K = 2, K = 4, K = 8 and K = 16. This problem
% should teach you that a square wave can be approximated better than a
% square pulse if you keep the same number of coefficients. This should
% be the case because the square wave looks the same at all points, but the
% square pulse doesn?t. Explain this statement.

T = 32;
fs = 8;
f0 = 0.25;
t = 0:1/fs:T-1/fs;
N = T*fs;
n = 0:N-1;
K = 32;

% Generating the square wave
%squareWave = square(2*pi*.25*t);
squareWave = (1/sqrt(N))*sign(cos(2*pi*(f0/fs)*n))';
plot(t,squareWave);
% [f,X,f_c,X_c]=dft(squareWave,fs);
% [t,x]=idft(X,fs);
% figure
% plot(t,x)
% Compressing square wave
[f,Kcoeff] = sig_compression(K,squareWave,fs);

% Reconstructing square wave
[t,xk] = sig_reconstruct_k(Kcoeff,f,fs,N);

% Energy of error signal
xkEnergy = dot(xk,xk);
squareEnergy = dot(squareWave,squareWave);
energyDiffSquareWave = abs(xkEnergy-squareEnergy);
%energyDiff = dot(xk-squareWave,xk-squareWave);
% Plotting reconstructed square wave
figure
plot(t,xk);
