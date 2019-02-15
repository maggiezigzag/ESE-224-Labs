function [complex_e, real_e, imag_e] = complex_e2D(k,l,N)
% complex_e takes a scalar k, l for frequencies and integer
% N for signal duration and returns three matrices of size N^2:
% one of the complex signal, one of the real parts of the
% signal, and one of the imaginary parts of the signal.

complex_e = zeros(N,N);

for n = 1:N
    for m = 1:N
        complex_e(m,n)=1/N*exp(-1j*2*pi*(k*m+l*n)/N);
    end
end

real_e = real(complex_e);

imag_e = imag(complex_e);

end