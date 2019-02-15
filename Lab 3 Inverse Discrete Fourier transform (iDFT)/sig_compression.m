function [I,Kcoeff] = sig_compression(K,x,fs)
 
%N = length(x);
 
[f,X,~,~] = dft(x,fs);
%mx = abs(X);
% Sorting the coefficients in descending order, taking indexes
[B,I] = sort(X,'descend');
% Taking the first K largest coefficients
Kcoeff = B(1:K);
% Taking the corresponding frequencies at those values
% f = f(I);
% f = f(1:K);
I = I(1:K);
end