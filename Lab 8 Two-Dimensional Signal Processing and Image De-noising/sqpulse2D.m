function [t,x]=sqpulse2D(T0,T,fs)

N=floor(T*fs);
M=floor(T0*fs);
x=zeros(N,N);
x(1:M,1:M) = 1;
t=(0:1/fs:T-1/fs)';
t = repmat(t,[1,N]);

end