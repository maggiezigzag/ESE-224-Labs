function [n,ekN]=cexp(k,N)
% cexp Generate a discrete-time complex exponential
%	[n,x]=cexp(k,N) generates a vector x of length N and unit energy that
%	represents the N discrete values of a complex exponential of frequency
%	k. That is, x(n)=1/sqrt(N)*exp(j 2 pi k n / N). The output vector n
%	contains the corresponding discrete-time index.
%
%	See also exp, expm.
if ~isscalar(k)
	error_msg='The frequency k should be a scalar.';
	error(error_msg);
end
if ~isscalar(N)
	error_msg='The duration N should be an integer.';
	error(error_msg);
end
if mod(N,1)
	error_msg='The duration N should be an integer.';
	error(error_msg);
end
n=(0:(N-1))';
ekN=1/sqrt(N)*exp(1j*2*pi*k*n/N);
end