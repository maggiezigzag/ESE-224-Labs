function X_LPF=lpf_freq(X,f0,fs,varargin)
% lpf_freq Applies a perfect low-pass filter in frequency domain.
%	Y=lpf_freq(X,f0,fs) sets to zero the frequency components corresponding
%	to frequencies over f0 as determined by sampling frequency fs. Y is the
%	corresponding frequency vector with zero on frequencies above f0. This
%	function considers X to be starting at f=0.
%
%	Y=lpf_freq(X,f0,fs,'centered') considers frequency components X as
%	coming from the centered version. That is, it considers the frequency
%	components to come from frequencies taken from (-fs/2;fs/2].
%
%	See also conv.

% Created by Fernando Gama (fgama@seas.upenn.edu) for ESE-224 course. Spring
% 2016.

if ~isvector(X) || ~isnumeric(X)
	error_msg='First input should be the frequency components.';
	error(error_msg);
end
K=length(X);
X=reshape(X,K,1);
if ~isnumeric(f0) || ~isnumeric(fs)
	error_msg=['Carrier frequency and sampling frequency ' ...
		'should be positive scalars.'];
	error(error_msg);
end
if ~isscalar(f0) || ~isscalar(fs)
	error_msg=['Carrier frequency and sampling frequency ' ...
		'should be positive scalars.'];
	error(error_msg);
end
if f0<0
	warning_msg='Absolute value of carrier frequency is used instead';
	warning(warning_msg);
	f0=-f0;
end
if fs<0
	warning_msg='Absolute value of sampling frequency is used instead';
	warning(warning_msg);
	fs=-fs;
end
if ~f0
	warning_msg='Carrier frequency set to zero. Returning same X vector.';
	warning(warning_msg);
	X_LPF=X;
	return
end
if ~fs
	warning_msg='Sampling frequency set to zero. Returning empty vector.';
	warning(warning_msg);
	X_LPF=[];
	return
end
if ~isempty(varargin) % If the third argument is there
	if length(varargin)>1
		error_msg='Too many input arguments. See help lpf_freq.';
		error(error_msg);
	end
	if length(varargin)==1
		situation=varargin{1};
		if ~ischar(situation)
			error_msg='Wrong call to function. See help lpf_freq.';
			error(error_msg);
		end
		if ~strcmp(situation,'centered')
			error_msg='Wrong call to function. See help lpf_freq.';
			error(error_msg);
		end
	end
else
	situation=[];
end

f=(-ceil(K/2-1):floor(K/2))'*fs/K;
if isempty(situation)
	X=circshift(X,ceil(K/2)-1);
end
index=find(abs(f)<f0);
X_LPF=zeros(K,1);
X_LPF(index)=X(index);
if isempty(situation)
	X_LPF=circshift(X_LPF,-(ceil(K/2)-1));
end
end