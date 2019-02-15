function xg = voice_modulation(X_BL,fc,fs)

t = length(X_BL)/fs; % seconds
[~,cexp]=cexpt(fc,t,fs);
xg = cexp.*X_BL;

end