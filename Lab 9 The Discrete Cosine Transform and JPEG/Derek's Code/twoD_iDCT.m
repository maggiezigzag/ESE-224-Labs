function iDCT = twoD_iDCT(X)
    [~,N] = size(X);
    iDCT = zeros(N);
    for m = 1:N
        for n = 1:N
            for k = 1:N
                for l = 1:N
                    if k == 1 && l == 1
                        iDCT(m, n) = iDCT(m,n) + (X(k, l)*(1/2)*...
                            cos((k-1)*pi*(2*(m-1)+1)/(2*N))*...
                            cos((l-1)*pi*(2*(n-1)+1)/(2*N)));
                    elseif k == 1
                        iDCT(m, n) = iDCT(m,n) + (X(k, l)*(1/sqrt(2))*...
                            cos((k-1)*pi*(2*(m-1)+1)/(2*N))*...
                            cos((l-1)*pi*(2*(n-1)+1)/(2*N)));
                    elseif l == 1
                        iDCT(m, n) = iDCT(m,n) + (X(k, l)*(1/sqrt(2))*...
                            cos((k-1)*pi*(2*(m-1)+1)/(2*N))*...
                            cos((l-1)*pi*(2*(n-1)+1)/(2*N)));
                    else
                        iDCT(m, n) = iDCT(m,n) + (X(k, l)*...
                            cos((k-1)*pi*(2*(m-1)+1)/(2*N))*...
                            cos((l-1)*pi*(2*(n-1)+1)/(2*N)));
                    end
                end
            end
        end
    end
    iDCT = iDCT .* (2/N);
end