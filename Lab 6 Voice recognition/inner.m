function [inner_product] = inner(X,Y)
    p = abs(transpose(X))*abs(Y);
    inner_product = sqrt(p);
end
