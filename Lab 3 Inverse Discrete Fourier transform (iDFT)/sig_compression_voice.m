function [f,Kcoeff] = sig_compression_voice(K,x,fs)

%N = length(x);

[f,X,~,~] = dft(x,fs);
% mx = abs(X);
% Sorting the coefficients in descending order, taking indexes
[B,I] = sort(X,'descend');
% Taking the first K/2 largest coefficients
Kcoeff = B(1:K/100);
I = I(1:K/100);
% Ignoring order, taking first K coefficients
%Kcoeff = X(1:K);
% Taking the corresponding frequencies at those values for K/2 largest
%I=1:K;
 f = f(I);
% Taking first k frequencies
% f = f(1:K);

end