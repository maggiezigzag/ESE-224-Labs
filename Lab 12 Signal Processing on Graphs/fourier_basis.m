n = 20;
S = Xdc(n);
F = dftmtx(length(S))/sqrt(n);
L = F*S*F';
[V,D] = eig(L);
L = round(L,3);

A_sc = S+S.';
S_2 = laplacian(A_sc);

