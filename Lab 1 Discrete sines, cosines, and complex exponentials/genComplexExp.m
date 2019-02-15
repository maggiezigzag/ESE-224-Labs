function [v1, v2, v3] = genComplexExp(k,l,N)
% v1 is elements of signal
% v2 is real parts of signal
% v3 is imaginary parts of signal

n = 0:1:(N-1);

v1 = (1/sqrt(N))*exp(j*2*pi*k*n/N);
v2 = real(v1);%cosine
v3 = imag(v1);

l1 = (1/sqrt(N))*exp(j*2*pi*l*n/N);
l2 = real(l1);
l3 = imag(l1);

hold on
plot(v2,'*-')
plot(v3,'*-')
hold on
plot(l2)
plot(l3)

legend('signal k real','signal k imag', 'signal l real','signal l imag');
title('k = 3, l = 29, N = 32');

end