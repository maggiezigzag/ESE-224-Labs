function [cosine,N] = cosine_gen(fs,T,f0)
N = T*fs;
f0 = 2^((f0-49)/12)*440;
k = N*f0/fs;
n = 0:1:N-1;
cosine = cos(2*pi*k*n./N);
end

