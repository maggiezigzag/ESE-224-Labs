%% 1.1
x = ones(5);
x = x/sqrt(length(x));
y = ones(5);
y = y/sqrt(length(y));
in = inner2D(x,y);

%% 1.2
k = 2;
l = 3;
N = 5;
[complex_e, real_e, imag_e] = complex_e2D(k,l,N)

%% 1.3
clear;
T0 = .5;
T = 32;
fs = 8;
[t,x]=sqpulse2D(T0,T,fs);
imshow(x);
title('Square Pulse with T = 32s, fs = 8Hz, and T0 = .5');

%% 1.4
clear;
mu = 3;
sigma = 1;
Ts = 0.01;

[x,y,z,myX,Y] = gaussPulse2D(mu, sigma, Ts);
% Plotting 1D representation of 2D Gaussian Pulse
imagesc(x,y,z);
title('Gaussian Pulse, mu = 3, sigma = 1, Ts = 0.01');
figure;
% Plotting 2D representation of 2D Gaussian Pulse
surf(myX,Y,z); shading interp
title('Gaussian Pulse, mu = 3, sigma = 1, Ts = 0.01');

%% 1.5 
clear;
mu = 0;
sigma = 2;
Ts = .05;
fs = 1/Ts;

% Generating Gaussian Pulse
[t,~,z,~,~] = gaussPulse2D(mu, sigma, Ts);
N = length(z);

% % TEST: take fft2 to check
X = fft2(z);

% Taking my2Ddft
%[fk,myX] = my2Ddft(z,fs);

%figure();
%fk = circshift(fk,floor(length(fk)/2));
%plot(fk,abs(X));

%imshow(abs(myX));
%figure;
%imshow(abs(X));
figure;
surf(abs(X));
title('DFT of a 2d Gaussian pulse with mu = 0 and sigma = 2');


%% 1.6 iDFT

% % Computing 2D iDFT
% z = ifft2(X);
% Creating meshgrid
%x=-3*sigma:Ts:3*sigma;
%y = x';
%[X,Y]=meshgrid(x,y);
% % Plotting iDFT
% imagesc(x,y,z);
% figure;
% surf(X,Y,z); shading interp
[t,~,z,~,~] = gaussPulse2D(mu, sigma, Ts);
%N = length(z);

% % TEST: take fft2 to check
X = fft2(z);
%fs = 1/0.5;
[iDFT] = my2DiDFT(X);
%figure;
%imagesc(x,y,iDFT);
figure;
surf(abs(iDFT)); shading interp
title('iDFT of Gaussian Pulse, mu = 0, sigma = 2');

%% 2.1
sigma = 4;
x = imread('imgA.png');
x = im2double(x);
y = imread('imgB.png');
y = im2double(y);
mu = 0;
Ts = 1;
[~,~,z,X,Y] = gaussPulse2D(mu, sigma, Ts);

x_denoised = conv2(x,z,'same');
y_denoised = conv2(y,z,'same');

imagesc(x_denoised);
title('imgA.png, sigma = 4');
colormap('gray');
figure;

imagesc(y_denoised);
title('imgB.png, sigma = 4');
colormap('gray');

