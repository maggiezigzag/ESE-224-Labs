fs = 44100;
T = 0.5*[1 1 1 1 1 1 2 1 1 1 1 1 1 2 1 1 1 1 1 1 2 1 1 1 ... 
    1 1 1 2 1 1 1 1 1 1 2 1 1 1 1 1 1 2];
notes = [40 40 47 47 49 49 47 45 45 44 44 42 42 40 47 47 ...
    45 45 44 44 42 47 47 45 45 44 44 42 40 40 47 47 49 ...
    49 47 45 45 44 44 42 42 40];
melody = [];
for i = 1:length(notes)
    [note,N]=cosine_gen(fs, T(i), notes(i));
    melody = [melody note zeros(1,10)]; 
end
sound(melody,fs);