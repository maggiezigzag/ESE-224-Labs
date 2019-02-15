% Lab 10
%% 1.1

K = 2;
[e_vectors,hermitian] = decomp_PCA(V,K);

[~,I] = sort(diag(D),'descend');

%% 1.2

K = 1000;
sigma = V(:,I(1:K));
[projection] = decomp_eig(face,mu,sigma);

%% 2.1

K = 1000;
K_coeff = projection;
K_e_faces = V(:,I(1:K));
[reconstructed_face] = reconstruction(K_e_faces,mu,K_coeff);

%% 2.2 

[~,I] = sort(diag(D),'descend');
face = double(imread('att_faces/s10/5.pgm'));

for K = 0:length(face)
    sigma = V(:,I(1:K));
    K_e_faces = sigma;
    [projection] = decomp_eig(face,mu,sigma);
    K_coeff = projection;
    energy(K+1:length(face)-1) = norm(face-reconstruction(K_e_faces,mu,K_coeff))^2;
end

plot(energy);
title('Reconstruction error: PCA vs energy difference');
xlabel('PCA');
ylabel('Energy Difference between original and reconstructed face');