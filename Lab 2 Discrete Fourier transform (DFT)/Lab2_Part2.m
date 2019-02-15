%% 1.2 DFTs of square pulses

clear;
fs = 8;     % Sampling frequency
T = 32;     % Time of signal in seconds
Ts = 1/fs;  % Sampling time of signal
T0 = 16;     % Pulse duration
t = -T/2:Ts:T/2-Ts;                      % Time vector of square pulse
squarePulse = rectpuls(t,T0);     % Generation of square pulse signal
[fk,X]=mydft(squarePulse,fs);       % Calling the DFT function
mx = abs(X);                        % We only look at magnitude of DFT
X_chop = mx(fk<abs(1/T0));
energy_X_chop = dot(X_chop,X_chop);
energy_DFT = dot(mx,mx);
%energy = sum(mx.^2)/length(mx);
plot(fk,mx);
figure(2)
plot(t,squarePulse);

%% 1.3 DFTs of triangular pulses

clear;
fs = 8;     % Sampling frequency
T = 32;     % Time of signal in seconds
Ts = 1/fs;  % Sampling time of signal
T0 = 1;     % Pulse duration
N = T/Ts;   % Number of samples
M = T0/Ts;
t = -T/2:1/fs:T/2-1/fs;                     % Time vector of triangular pulse
squarePulse = rectpuls(t,T0);
triangularPulse = conv(squarePulse,squarePulse,'same');     % Generating triangular pulse by convoluting rectangular pulse with itself
[fk,X] = mydft(triangularPulse,fs);  % Calling the DFT function
fT0 = fk(length(fk)/2-fs:length(fk)/2+fs);
mx = abs(X);      % We only look at magnitude of DFT
plot(fk,mx);
figure(2)
plot(t,triangularPulse);
energy = sum(mx(length(mx)/2-fs:length(mx)/2+fs).^2);
%energy = T*norm(mx)^2;

%% 1.4 Other pulses

% https://en.wikipedia.org/wiki/Window_function#Rectangular_window

