function [total,N] = cosine_harmonics(fs, T, f0, instrument)
N = T*fs;
k = N * f0/fs; %frequency 
n = floor(0) : floor(N-1); %vector 
total = zeros(1,N);

for h = 1: length(instrument) 
    note = cos(2 * pi * f0 * h* n * 1/fs); %vector
    newNote = instrument(h) * note;
    total = total + newNote;
end 

end
