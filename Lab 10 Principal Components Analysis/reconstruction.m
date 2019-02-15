function [reconstructed_face] = reconstruction(K_e_faces,mu,K_coeff)

reconstructed_face = K_e_faces*K_coeff + mu(:);
reconstructed_face = reshape(reconstructed_face,[112,92]);

end