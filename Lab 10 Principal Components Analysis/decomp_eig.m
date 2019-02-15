function [projection] = decomp_eig(face,mu,sigma)

projection = sigma'*(face(:)-mu(:));

end