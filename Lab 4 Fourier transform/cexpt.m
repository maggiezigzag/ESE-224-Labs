function [t,x]=cexpt(f,T,fs)
% cexpt Generate a continuous-time complex exponential
%	[t,x]=cexpt(f,T,fs) generates a vector x that contains samples of a
%	complex exponential of frequency f and duration T sampled at frequency 
%	fs. The output vector t contains the corresponding continuous-time axis.
%
%	See also cexp, exp.
if ~isscalar(f) || ~isscalar(T) || ~isscalar(fs)
	error_msg='Inputs must be scalars.';
	error(error_msg);
end
if T<0
	error_msg='Duration of the signal cannot be negative.';
	error(error_msg);
end
if ~T
	warning_msg='Zero duration selected. Outputting empty vector.';
	warning(warning_msg);
	x=[];
	return
end
if fs<0
	warning_msg=['Selected sampling frequency is negative. ' ...
		'Using the absolute value instead.'];
	warning(warning_msg);
	fs=-fs;
end
if ~fs
	error_msg='Sampling frequency cannot be zero.';
	error(error_msg);
end
if f<0
	warning_msg=['Selected complex exponential frequency is negative. ' ...
		'Using the absolute value instead.'];
	warning(warning_msg);
	f=-f;
end
N=floor(T*fs);
t=(0:1/fs:(N-1)/fs)';
if ~f
	warning_msg=['Zero complex exponential frequency selected. '...
		'Output is a constant'];
	warning(warning_msg);
	x=1/sqrt(N)*ones(N,1);
	return;
end
k=N*f/fs;
[~,x]=cexp(k,N);
x=sqrt(N)*x;
end