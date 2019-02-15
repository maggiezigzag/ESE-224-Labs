function [t,xk] = sig_reconstruct(Kcoeff,fs,N)

% Given the DFT coefficients, we chop it in half from N/2+1 to N/2. 
lengthKcoeff = zeros(N/2+1,1);
lengthKcoeff(1:length(Kcoeff)) = Kcoeff;
% Compute the iDFT 
[t,xk] = myidft(lengthKcoeff,fs);

end