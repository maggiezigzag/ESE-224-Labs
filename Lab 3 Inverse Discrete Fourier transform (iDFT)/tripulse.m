function [t,x]=tripulse(T0,T,fs)
% tripulse Generates a unit-energy triangular pulse
%	[t,x]=tripulse(T0,T,fs) generates a unit-energy triangular pulse x(t) of 
%	duration T sampled at frequency fs and with active duration T0.
%	Vector t contains the time indices (x axis) and vector x contains
%	the values of the signal (y axis).
%
%	See also sqpulse.

% Created by Fernando Gama (fgama@seas.upenn.edu) for ESE-224 course. Spring
% 2016.

%%\\\\\ START: SANITY CHECK OF INPUTS.
if ~isnumeric(T0)
	error_msg='Active time T0 has to be a number.';
	error(error_msg);
end
if ~isscalar(T0)
	error_msg='Active time T0 has to be a scalar.';
	error(error_msg);
end
if ~isnumeric(T)
	error_msg='Duration time T has to be a number.';
	error(error_msg);
end
if ~isscalar(T)
	error_msg='Duration time T has to be a scalar.';
	error(error_msg);
end
if ~isnumeric(fs)
	error_msg='Sampling frequency fs has to be a number.';
	error(error_msg);
end
if ~isscalar(fs)
	error_msg='Sampling frequency fs has to be a scalar.';
	error(error_msg);
end
if ~T
	t=[]; x=[];
	return
end
if ~T0
	N=floor(T*fs);
	t=(0:1/fs:T-1/fs)';
	x=zeros(N,1);
	return
end
if T0>T;
	warning_msg=['Active time T0 is greater than duration time T. '...
		'An active signal of duration T is created.'];
	warning(warning_msg);
	N=floor(T*fs);
	M=floor(T0*fs);
	aux=M+2;
	x=[(0:floor(T0/2*fs))';((ceil(T0/2)*fs):M)';zeros(aux-M,1)];
	x=x(1:N);
	t=(0:1/fs:T-1/fs)';
	return
end
if T<0
	error_msg='Duration time T has to be a positive number.';
	error(error_msg);
end
if T0<0
	error_msg='Active time T0 has to be a positive number.';
	error(error_msg);
end
if ~fs
	error('Frequency cannot be zero.');
end
if fs<0
	warning_msg='Absolute value of sampling frequency is used instead';
	warning(warning_msg);
	fs=-fs;
end

%%\\\\\ END: SANITY CHECK OF INPUTS.



%%\\\\\ START: COMPUTATION OF UNIT-ENERGY SQUARE PULSE.


% First, we have to come up with how many samples we have to take. We know
% we sample every Ts=1/fs. So in T time we can sample T/Ts=T*fs times.
% Then,
N=floor(T*fs);
% Now, we need to compute how  many of these N samples correspond to the
% active time of the signal. Same reasoning: I need to know how many times
% we can sample in T0 time with sampling frequency fs. Then,
M=floor(T0*fs);
% Now we have what we need to come up with the vector x. This vector x has
% to grow from x(0)=0 to x(T0/2)=max to x(T0)=0 again in a linear fashion.
% We can do this by concatenating vectors:
active_part=[(0:ceil(T0/2*fs)-1)';-(-(ceil(T0/2*fs)-1):0)'];
x=[active_part;zeros(N-length(active_part),1)];
% Normalize it to have unit energy:
x=x/norm(x);
% Finally, the time index is given by the instants that where samples. So I
% need a vector that starts at t=0 and finishes at t=T and in which there
% fit N samples. Or, to put it in a more "coding" way, we need a vector
% that starts at 0, runs until T and has Ts=1/fs increments. That is
t=(0:1/fs:T-1/fs)';

%%\\\\\ END: COMPUTATION OF UNIT-ENERGY SQUARE PULSE.

end