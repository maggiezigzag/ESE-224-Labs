fs = 20000;

ones = zeros(40000,2);

for i = 1:10
    sound = record_sound(2,fs,8,1);
    [f,X,f_c,X_c] = dft(sound,fs);
    ones(:,i) = X_c/norm(X_c);
end

HY = mean(ones,2);

one = figure();
plot(f_c,abs(HY));
axis([-2000 2000 0 .09]);
title('Average "ONE" signal');
saveas(one,sprintf('ONES.png'));

twos = zeros(40000,2);

for i = 1:10
    sound = record_sound(2,fs,8,1);
    [f,X,f_c,X_c] = dft(sound,fs);
    twos(:,i) = X_c/norm(X_c);
end

HZ = mean(twos,2);

two = figure();
plot(f_c,abs(HZ));
axis([-2000 2000 0 .09]);
title('Average "TWO" signal');
saveas(two,sprintf('TWO.png'));

%% Comparison with average spectrum

% Unknown spectrum X
sound = record_sound(2,20000,8,1);
sound = sound / norm(sound);

% impulse responses of training sets (HY and HZ)
[~,hy] = idft(abs(HY),fs, 'centered');
[~,hz] = idft(abs(HZ),fs, 'centered');

y = conv(sound,hy);
z = conv(sound,hz);

energyY = norm(y)^2;
energyZ = norm(z)^2;

if energyY>energyZ
    fprintf('You said ONE');
else
    fprintf('You said TWO');
end

%% Online operation

sound = record_sound(2,20000,8,1);
sound = sound / norm(sound);

[~,hy] = idft(abs(HY),fs, 'centered');
[~,hz] = idft(abs(HZ),fs, 'centered');

plotArray = zeros(40000,1);

for i = 1:40000
    testOne = conv(sound(1:i),hy);
    testTwo = conv(sound(1:i),hz);
    energyTestOne = norm(testOne)^2;
    energyTestTwo = norm(testTwo)^2;

    if energyTestOne>energyTestTwo
        plotArray(i) = 1;
    else
        plotArray(i) = 2;
    end
end

plot(1:40000,plotArray);title('Increasing Accuracy Predicting "ONE" or "TWO" with Increasing Samples');xlabel('Sample number');ylabel('One or Two');
