% 4 Larger number of digits

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
saveas(one,sprintf('ONE.png'));

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

threes = zeros(40000,2);

for i = 1:10
    sound = record_sound(2,fs,8,1);
    [f,X,f_c,X_c] = dft(sound,fs);
    threes(:,i) = X_c/norm(X_c);
end

three_avg = mean(threes,2);

three = figure();
plot(f_c,abs(three_avg));
axis([-2000 2000 0 .09]);
title('Average "THREE" signal in frequency');
saveas(three,sprintf('THREE.png'));

fours = zeros(40000,2);

for i = 1:10
    sound = record_sound(2,fs,8,1);
    [f,X,f_c,X_c] = dft(sound,fs);
    fours(:,i) = X_c/norm(X_c);
end

four_avg = mean(fours,2);

four = figure();
plot(f_c,abs(four_avg));
axis([-2000 2000 0 .09]);
title('Average "FOUR" signal in frequency');
saveas(four,sprintf('FOUR.png'));

fives = zeros(40000,2);

for i = 1:10
    sound = record_sound(2,fs,8,1);
    [f,X,f_c,X_c] = dft(sound,fs);
    fives(:,i) = X_c/norm(X_c);
end

five_avg = mean(fives,2);

five = figure();
plot(f_c,abs(five_avg));
axis([-2000 2000 0 .09]);
title('Average "FIVE" signal in frequency');
saveas(one,sprintf('FIVE.png'));

sixes = zeros(40000,2);

for i = 1:10
    sound = record_sound(2,fs,8,1);
    [f,X,f_c,X_c] = dft(sound,fs);
    sixes(:,i) = X_c/norm(X_c);
end

six_avg = mean(sixes,2);

six = figure();
plot(f_c,abs(six_avg));
axis([-2000 2000 0 .09]);
title('Average "SIX" signal in frequency');
saveas(one,sprintf('SIX.png'));

sevens = zeros(40000,2);

for i = 1:10
    sound = record_sound(2,fs,8,1);
    [f,X,f_c,X_c] = dft(sound,fs);
    sevens(:,i) = X_c/norm(X_c);
end

seven_avg = mean(sevens,2);

seven = figure();
plot(f_c,abs(seven_avg));
axis([-2000 2000 0 .09]);
title('Average "SEVEN" signal in frequency');
saveas(seven,sprintf('SEVEN.png'));

eights = zeros(40000,2);

for i = 1:10
    sound = record_sound(2,fs,8,1);
    [f,X,f_c,X_c] = dft(sound,fs);
    eights(:,i) = X_c/norm(X_c);
end

eight_avg = mean(eights,2);

eight = figure();
plot(f_c,abs(eight_avg));
axis([-2000 2000 0 .09]);
title('Average "EIGHT" signal in frequency');
saveas(eight,sprintf('EIGHT.png'));

nines = zeros(40000,2);

for i = 1:10
    sound = record_sound(2,fs,8,1);
    [f,X,f_c,X_c] = dft(sound,fs);
    nines(:,i) = X_c/norm(X_c);
end

nine_avg = mean(nines,2);

nine = figure();
plot(f_c,abs(nine_avg));
axis([-2000 2000 0 .09]);
title('Average "NINE" signal in frequency');
saveas(nine,sprintf('NINE.png'));

tens = zeros(40000,2);

for i = 1:10
    sound = record_sound(2,fs,8,1);
    [f,X,f_c,X_c] = dft(sound,fs);
    tens(:,i) = X_c/norm(X_c);
end

ten_avg = mean(tens,2);

ten = figure();
plot(f_c,abs(ten_avg));
axis([-2000 2000 0 .09]);
title('Average "TEN" signal in frequency');
saveas(ten,sprintf('TEN.png'));
%% comparison using nearest neighbor comparison

% Unknown spectrum X
sound = record_sound(2,20000,8,1);
% take DFT and normalize to make it look nicer
[~,~,f_c,X_c] = dft(sound,20000);
X = X_c / norm(X_c);

for i = 1:10
    innerX1(:,1) = inner(abs(X),abs(ones(:,1)));
    innerX2(:,1) = inner(abs(X),abs(twos(:,1)));
    innerX3(:,1) = inner(abs(X),abs(threes(:,1)));
    innerX4(:,1) = inner(abs(X),abs(fours(:,1)));
    innerX5(:,1) = inner(abs(X),abs(fives(:,1)));
    innerX6(:,1) = inner(abs(X),abs(sixes(:,1)));
    innerX7(:,1) = inner(abs(X),abs(sevens(:,1)));
    innerX8(:,1) = inner(abs(X),abs(eights(:,1)));
    innerX9(:,1) = inner(abs(X),abs(nines(:,1)));
    innerX10(:,1) = inner(abs(X),abs(tens(:,1)));
end

[Y,I] = max([max(innerX1),max(innerX2),max(innerX3),max(innerX4),max(innerX5),...
        max(innerX6),max(innerX7),max(innerX8),max(innerX9),max(innerX10)]);
if I == 1
    fprintf('You said ONE');
end
if I == 2 
    fprintf('You said TWO');
end
if I == 3
    fprintf('You said THREE');
end
if I == 4
    fprintf('You said FOUR');
end
if I == 5 
    fprintf('You said FIVE');
end
if I == 6
    fprintf('You said SIX');
end
if I == 7 
    fprintf('You said SEVEN');
end
if I == 8
    fprintf('You said EIGHT');
end
if I == 9
    fprintf('You said NINE');
end
if I == 10 
    fprintf('You said TEN');
end
