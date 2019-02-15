function [X] = Xdc(N)
X = zeros(N, N);
for i = 1 : N
    for j = 1 : N
        if (i == 1 && j == N) 
            X(1, N) = 1;
        elseif (i ~= 1 && j == i - 1) 
            X(i, j) = 1;
        else 
            X(i, j) = 0;
        end
    end
end
end
