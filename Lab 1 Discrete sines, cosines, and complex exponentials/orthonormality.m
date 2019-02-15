function [answer] = orthonormality(N)

answer = zeros(N);
n = (0:(N-1));

for k = n
    for l = n
        x = complex_e(k,N)'*(complex_e(l,N));
        answer(k+1,l+1)=x;
    end
end

imagesc(real(answer));

end