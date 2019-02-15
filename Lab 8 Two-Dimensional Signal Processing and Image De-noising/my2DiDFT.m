function [iDFT] = my2DiDFT(DFT)

N = length(DFT);
% DFT = DFT(1:N/2+1,1:N/2+1);
% % Upper half
% DFT_RHS = fliplr(conj(DFT));
% DFT_RHS = DFT_RHS(:,2:end);
% DFT_upperhalf = [DFT, DFT_RHS];
% % Lower half
% DFT_lowerhalf = flipud(DFT_upperhalf);
% DFT_lowerhalf = DFT_lowerhalf(2:end,:);
% DFT_Whole = [DFT_upperhalf; DFT_lowerhalf];

iDFT = zeros(N,N);

for m = 0:N-1
    for n = 0:N-1
        [complex_e, ~, ~] = complex_e2D(m,n,N);
        iDFT(m+1,n+1) = inner2D(DFT,(complex_e));
    end
end

end