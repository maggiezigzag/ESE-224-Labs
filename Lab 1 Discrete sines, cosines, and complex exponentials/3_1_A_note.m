
f0 = 440;
fs = 44100;
T = 2;
cosine = cosine_gen(fs,T,f0);
sound(cosine);