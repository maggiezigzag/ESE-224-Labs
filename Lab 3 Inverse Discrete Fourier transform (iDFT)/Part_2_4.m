% Part 2.4

n = 5; % seconds
fs = 20000; % 20 kHz
b = 8; % bits
channel = 1;
% Recording sound
x = record_sound(n,fs,b,channel);
K = n*fs;
divideSpeech = zeros(K, 1);

for i = 1:2000:K
    divideSpeech(i:i+1999) = x(i:i+1999);
    [f,Kcoeff] = sig_compression_voice(K,divideSpeech(i:i+1999),fs);
    [t,xk] = sig_reconstruct_k(Kcoeff,f,fs,1000);
end

% Playing voice clip back
realxk = real(xk);
sound(realxk,fs);
