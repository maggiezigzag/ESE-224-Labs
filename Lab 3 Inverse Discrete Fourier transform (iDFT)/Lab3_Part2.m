% Lab 3 Part 2

%% 2.1 Record, graph, and play your voice.

n = 5; % seconds
fs = 20000; % 20 kHz
b = 8; % bits
channel = 1;
% Recording sound
x=record_sound(n,fs,b,channel);
% Plotting voice
plot(x);
% Generating DFT of voice
[f,X,f_c,X_c]=dft(x,fs);
% Plotting DFT of voice
figure
mx = abs(X_c);
plot(f_c,mx);
% Playing voice clip back
sound(x,fs);

%% 2.2 Voice compression.

K = 25000;
n = 5; % seconds
fs = 20000; % 20 kHz
b = 8; % bits
channel = 1;
% Recording sound
x=record_sound(n,fs,b,channel);
% DEBUGGING: Plots of original signal
plot(x)
title('Original voice')
xlabel('Time');
ylabel('Frequency');
N = n*fs;
[f,X,f_c,X_c]=dft(x,fs);

[I,Kcoeff] = sig_compression_voice(K,x,fs);
% Vector for frequencies
F = zeros(length(I),1);
F(I) = Kcoeff;
[t,xK]=idft(F,fs);
% Only taking real parts of signal since soundsc won't play complex numbers
newxK = real(xK);
% DEBUGGING: Plots of compressed voice
figure
plot(t,xK);
title('Compressed voice')
xlabel('Time (s)')
ylabel('Frequency')
sound(newxK,fs);

%% 2.3 Voice masking

% Katrina's voice
n = 5; % seconds
fs = 20000; % 20 kHz
b = 8; % bits
channel = 1;
% Recording sound
x=record_sound(n,fs,b,channel);
% Generating DFT of voice
[f,X,f_c,X_c]=dft(x,fs);
% Plotting DFT of voice
figure
mx = abs(X_c);
plot(f_c,mx);
title('Katrina Voice') % Says, "I love ESE 224"
xlabel('Time (s)')
ylabel('Frequency')

y=record_sound(n,fs,b,channel);
% Generating DFT of voice
[f,X,f_c,X_c]=dft(y,fs);
% Plotting DFT of voice
figure
mx = abs(X_c);
plot(f_c,mx);
title('Maggie Voice') % Says, "I love ESE 224"
xlabel('Time (s)')
ylabel('Frequency')

% Take first 1:N/2 coefficients/frequencies and then multiply them by a factor
% Then take the iDFT of the new coefficients/frequencies and play that back

% Changing Maggie's Voice
changedX = X(1:n*fs/2-1)*500;
newX = [changedX;X(n*fs/2:n*fs)];
[t,x]=idft(newX,fs);
realx = real(x);
sound(realx,fs);

%% 2.4 Better voice compression