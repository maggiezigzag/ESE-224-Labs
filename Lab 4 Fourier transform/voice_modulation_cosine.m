function xgc = voice_modulation_cosine(X_BL,fc,fs)

t = length(X_BL)/fs; % seconds
[~,cexp]=cexpt(fc,t,fs);
cexp = real(cexp);
xgc = cexp.*X_BL;

end