function [iDCT] = my2DiDCT(X)

[~,N] = size(X);
iDCT = zeros(N,N);

for m = 0:N-1
    for n = 0:N-1
        if m == 0 && n == 0
            iDCT(m+1,n+1) = iDCT(m+1,n+1)+X(m+1,n+1)...
                *(1/2)*cos((pi*m*(2*m+1))/(2*N))*cos((pi*n*(2*n+1))/(2*N));
        elseif m ~= 0 && n ~= 0
            iDCT(m+1,n+1) = iDCT(m+1,n+1)+X(m+1,n+1)...
                *cos((pi*m*(2*m+1))/(2*N))*cos((pi*n*(2*n+1))/(2*N));
        else
            iDCT(m+1,n+1) = iDCT(m+1,n+1)+X(m+1,n+1)...
                *(1/sqrt(2))*cos((pi*m*(2*m+1))/(2*N))*cos((pi*n*(2*n+1))/(2*N));
        end
        
    end
end

iDCT = (iDCT*2)/N;

end