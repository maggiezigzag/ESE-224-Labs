function[xk, times] = reconst(DFT_coef, N, fs)
DFT_Nlength = zeros(N/2+1,1);
DFT_Nlength(1:length(DFT_coef)) = DFT_coef;
[xk, times] = comp_iDFT(DFT_Nlength, fs);
end