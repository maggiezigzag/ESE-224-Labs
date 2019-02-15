function [complex_e, real_e, imag_e] = complex_e(k,N)
% complex_e takes a scalar k for frequency and integer
% N for signal duration and returns three vectors: one
% of the complex signal, one of the real parts of the
% signal, and one of the imaginary parts of the signal.

n=(0:(N-1))';
complex_e=1/sqrt(N)*exp(1j*2*pi*k*n/N);
% Real parts are defined as (1/sqrt(N))*cos(2*pi*k*n/N);
real_e = real(complex_e);
% Imaginary parts are defined as (1/sqrt(N))*sin(2*pi*k*n/N);
imag_e = imag(complex_e);

% plot(real_e);
% hold on
% plot(imag_e);
% 
% legend('real','imaginary');
% xlabel('N (signal duration)');
% ylabel('ekN(n) (signal value at time index n)');
% title('k = 16, N = 32');

end