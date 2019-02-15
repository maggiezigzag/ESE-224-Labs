
%% 1.1
clear;
N = 32;
k = 16;
[complex_e, real_e, imag_e] = complex_e(k,N);
hold on
plot(real_e);
plot(imag_e);
% graph information
legend('real','imaginary');
xlabel('N (signal duration)');
ylabel('ekN(n) (signal value at time index n)');
% title changes according to k and N
title('k = 2, N = 32');

%% 1.2

clear;
N = 32;
k = 3;
l = k-N;
hold on
[~, k_real_e, k_imag_e] = complex_e(k,N);
plot(k_real_e,'*-');
plot(k_imag_e,'*-');
[~, l_real_e, l_imag_e] = complex_e(l,N);
plot(l_real_e);
plot(l_imag_e);
legend('k=3 real','k=3 imag', 'l=-29 real',...
    'l=-29 imag');
title('k = 3, l = -29, N = 32');

%% 1.3
clear;
N = 32;
k = 3;
hold on
[k_complex_e, k_real_e, k_imag_e] = complex_e(k,N);
plot(k_real_e,'*-');
plot(k_imag_e,'*-');
[negk_complex_e, negk_real_e, negk_imag_e] = complex_e(-k,N);
plot(negk_real_e);
plot(negk_imag_e);
legend('k=3 real','k=3 imag', 'k=-3 real',...
    'k=-k imag');
title('k = 3, k = -3, N = 32');

%% 1.4
clear;
N = 32;
k = 3;
l = N-k;
hold on
[k_complex_e, k_real_e, k_imag_e] = complex_e(k,N);
plot(k_real_e,'*-');
plot(k_imag_e,'*-');
[l_complex_e, l_real_e, l_imag_e] = complex_e(l,N);
plot(l_real_e);
plot(l_imag_e);
legend('k real','k imag', 'l real','l imag');
title('k = 3, l = 29, N = 32');

%% 1.5
orthonormality(16);
