function [e_vectors,hermitian] = decomp_PCA(covariance,K)

%[e_vectors,e_values] = eig(covariance);
%[~,I] = sort(diag(e_values),'descend'); % take absolute eigenvalues?
e_vectors = covariance(:,(1:K));

% Check to see if matrix is Hermitian
hermitian = transpose(conj(e_vectors))*e_vectors;

end

