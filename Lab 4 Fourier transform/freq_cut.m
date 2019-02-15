function [X_BL] = freq_cut(x,fs,f0)

[f,X,~,~]=dft(x,fs);

for i = 1:length(f)
    if f(i)>f0
        f(i) = 0;
    end
end

for i = 1:length(X)
    if f(i) == 0
        X(i) = 0;
    end
end

X_BL = X;

end