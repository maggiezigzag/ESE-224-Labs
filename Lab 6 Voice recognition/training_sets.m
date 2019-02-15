fs = 20000;

ones = zeros(40000,2);

for i = 1:10
    sound = record_sound(2,fs,8,1);
    [f,X,f_c,X_c] = dft(sound,fs);
    ones(:,i) = X_c/norm(X_c);
end

one_avg = mean(ones,2);

one = figure();
plot(f_c,abs(one_avg));
axis([-2000 2000 0 .09]);
title('Average "ONE" signal in frequency');
saveas(one,sprintf('ONES.png'));

twos = zeros(40000,2);

for i = 1:10
    sound = record_sound(2,fs,8,1);
    [f,X,f_c,X_c] = dft(sound,fs);
    twos(:,i) = X_c/norm(X_c);
end

two_avg = mean(twos,2);

two = figure();
plot(f_c,abs(two_avg));
axis([-2000 2000 0 .09]);
title('Average "TWO" signal in frequency');
saveas(two,sprintf('TWO.png'));

%% 2 Comparison with average spectrum

% Unknown spectrum X
sound = record_sound(2,20000,8,1);
% take DFT and normalize to make it look nicer
[~,~,f_c,X_c] = dft(sound,20000);
X = X_c / norm(X_c);

innerXY = inner(abs(X),abs(one_avg));
innerXZ = inner(abs(X),abs(two_avg));

if innerXY>innerXZ
    fprintf('You said ONE');
else
    fprintf('You said TWO');
end

%% 3 Nearest neighbor comparison

sound = record_sound(2,20000,8,1);

[~,~,f_c,X_c] = dft(sound,20000);
X = X_c/norm(X_c);

for i = 1:10
    innerXYi(:,i) = inner(abs(X),(abs(ones(:,i))));
    innerXZi(:,i) = inner(abs(X),(abs(twos(:,i))));
end

innerXYimax = max(innerXYi);
innerXZimax = max(innerXZi);

if innerXYimax>innerXZimax
    fprintf('You said ONE');
else
    fprintf('You said TWO');
end
