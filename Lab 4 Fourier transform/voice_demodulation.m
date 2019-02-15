function demodulated_voice = voice_demodulation(z,fc,fs)

t = length(z)/fs; % seconds
[~,cexp]=cexpt(fc,t,fs);
cexp = conj(cexp);
demodulated_voice = z./(cexp+1);

end