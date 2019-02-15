% Lab 4 Part 1
%% 1.1 Fourier transform of a Gaussian pulse. 
%% 1.2 Numerical verification.

clear; clf; clc;
sigma=1; % value of sigma changes manually
N=50; % arbitrary length
fs = 50;
Ts = 1/fs;
t=-N:1:N;

x=exp(-t.^2/(2*sigma^2)); % Gaussian function
xs = circshift(x,[0 -N]); 

subplot(221);
plot(t,x);grid;
xlabel('Data waveform');
hold on; plot(t,x,'o'); hold off;

% Computed FT
xx=fft(xs);    
xxs = circshift(xx,[0 -N]);
subplot(222);
plot(t, abs(xxs));grid;xlabel('Transformed, magnitude');
hold on; plot(t,abs(xxs),'o'); hold off;

subplot(223);
plot(t, real(xxs));grid;xlabel('Transformed, real');
hold on; plot(t, real(xxs), 'o'); hold off; 

subplot(224)
plot(t,imag(xxs)); grid;
xlabel('Transformed, imaginary');
hold on; plot(t, imag(xxs), 'o'); hold off;

figure(gcf);

% Approximated FT
Xk = zeros(N*2+1,1);
for k = 1:N*2+1
    Xk(k) = Xk(k)+1/(sqrt(N))*(1/(Ts*sqrt(N)))*xxs(k);
end

Xks = circshift(Xk,[0 -N]);

% VERIFY:
figure; plot(t,xxs)
title('Computed FT');xlabel('frequencies');ylabel('values')
ylim([0 12])
figure; plot(t,Xks)
title('Derived FT');xlabel('frequencies');ylabel('values')
ylim([0 12])

% Since Xk = xx, which means that the Fourier transform of the Gaussian
% pulse is the same as the DFT of the sampled signal (which can be called
% an approximation of the FT), we verify that our derivation is correct.

%% 1.3 Fourier transform of a shifted Gaussian pulse.

clear; clf; clc;
sigma=1; % value of sigma changes manually
N=50; % arbitrary length of DFT
fs = 50;
Ts = 1/fs;
t=-N:1:N;
tau = 10; % shift length
mu = 0; % generic mu

x=exp(-(t+tau-mu).^2/(2*sigma^2)); % Gaussian function
xs = circshift(x,[0 -N]); 

subplot(221);
plot(t,x);grid;
xlabel('Data waveform');
hold on; plot(t,x,'o'); hold off;

xx=fft(xs)*exp(-1i*2*pi*tau); % shifted FT is simply multiplied by a complex number
xxs = circshift(xx,[0 -N]);
subplot(222);
plot(t, abs(xxs));grid;xlabel('Transformed, magnitude');
hold on; plot(t,abs(xxs),'o'); hold off;

subplot(223);

plot(t, real(xxs));grid;xlabel('Transformed, real');
hold on; plot(t, real(xxs), 'o'); hold off;

subplot(224)
plot(t,imag(xxs)); grid;
xlabel('Transformed, imaginary');
hold on; plot(t, imag(xxs), 'o'); hold off;

figure(gcf);

Xk = zeros(N*2+1,1);
for k = 1:N*2+1
    Xk(k) = Xk(k)+1/(sqrt(N))*(1/(Ts*sqrt(N)))*xxs(k);
end
Xks = circshift(Xk,[0 -N]);

% VERIFY:
figure; plot(abs(xxs))
title('Computed, Shifted FT');xlabel('frequencies');ylabel('values')
figure; plot(abs(Xks))
title('Derived, Shifted FT');xlabel('frequencies');ylabel('values')

% Since Xk = xx, which means that the Fourier transform of the Gaussian
% pulse is the same as the DFT of the sampled signal (which can be called
% an approximation of the FT), we verify that our derivation is correct.