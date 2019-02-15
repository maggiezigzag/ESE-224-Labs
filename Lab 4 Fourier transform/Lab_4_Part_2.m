% Lab 4 Part 2
%% 2.1 Voice as a bandlimited signal.

n = 3; % seconds
fs = 40000; % 20 kHz
f0 = 4000;
b = 8; % bits
channel = 1;
% Recording sound
x=record_sound(n,fs,b,channel);
% Plotting voice
plot(x);
% Generating DFT of voice
[~,~,f_c,X_c]=dft(x,fs);
% Plotting DFT of voice
figure
mx = abs(X_c);
plot(f_c,mx);
[X_BL] = freq_cut(x,fs,f0);
[~,reconstructed_x]=idft(X_BL,fs);
% Playing voice clip back
sound(real(reconstructed_x),fs);

%% 2.2 Voice modulation.

fc = 5000;
fs = 40000;
xg = voice_modulation(X_BL,fc,fs);

%% 2.3 Modulation with a cosine.

fc = 5000;
fs = 40000;
xgc = voice_modulation_cosine(X_BL,fc,fs);

%% 2.4 The voice of your partner.

n = 3; % seconds
fs = 40000; % 20 kHz
fc = 15000; % 15 kHz
f0 = 4000;  % 4 kHz
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
[X_BL_partner] = freq_cut(x,fs,f0);
[~,reconstructed_x_partner]=idft(X_BL_partner,fs);
% Playing voice clip back
sound(real(reconstructed_x_partner),fs);

xgc_partner = voice_modulation_cosine(X_BL_partner,fc,fs);

z = X_BL_partner+xgc_partner;

%% 2.5 Recover individual voices.

fc = 15000;
fs = 40000;
demodulated_voice = voice_demodulation(z,fc,fs);
[~,reconstructed_demodulated_voice]=idft(demodulated_voice,fs);
sound(real(reconstructed_demodulated_voice),fs);