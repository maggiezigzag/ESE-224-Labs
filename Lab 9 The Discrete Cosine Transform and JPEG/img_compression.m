function [k_coeff,patches,coeff] = img_compression(image,K)
% img_compression(image,K) takes image type string and number coefficients
% K and performs fft2 on the image, then returns the image in 8x8 patches, 
% the k largest coefficients k_coeff, and the total number of coefficients
% coeff.

% Loading and converting image into type double
img = double(imread(image));
%[N,~] = size(img);
% Splits image into 8 32x32 pixel blocks, given that the image size is 
% 256x256
patches = mat2cell(img, [8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8], ...
    [8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8]);
%patches = cell2mat(patches);
% Performs fft2 on each block
coeff=blockproc(img,[8, 8],@(block_struct)fft2(block_struct.data));
% Sorts coefficients in each block in descending order



% % Creating matrix filter of ones that takes the first K^2 2D DFT coefficients
% num_coeff = 8 - sqrt(K);
% num_coeff = num_coeff(1);
% 
% filter = ones(8);
% filter = triu(filter);
% filter = triu(filter,num_coeff);
% filter = filter';
% filter = flipud(filter);
% 
% % Multiplying matrix of coefficients with filter to retain only first K^2
% % coefficients
% k_coeff=blockproc(coeff,[8, 8],@(block_struct)block_struct.data.*filter);

end