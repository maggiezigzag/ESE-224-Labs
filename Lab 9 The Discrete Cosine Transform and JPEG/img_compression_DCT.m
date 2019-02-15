function [k_coeff,patches, coeff] = img_compression_DCT(image,K)

% Loading and converting image into type double
img = double(imread(image));
% Splits image into 8 32x32 pixel blocks, given that the image size is 
% 256x256
patches = mat2cell(img, [8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8], ...
    [8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8]);
%patches = cell2mat(patches);
% Performs my2D_DCT on each 32x32 block
coeff=blockproc(img,[8, 8],@(block_struct)my2D_DCT(block_struct.data));
%DMobj = DataMatrix(coeff);

% Sorts coefficients in each block in descending order
coeff = blockproc(coeff,[8,8],@(block_struct)sortrows(block_struct.data,'descend'));

% Creating matrix filter of ones that takes the largest K^2 2D DFT coefficients
num_coeff = 8 - sqrt(K);
num_coeff = num_coeff(1);

filter = ones(8);
filter = triu(filter);
filter = triu(filter,num_coeff);
filter = filter';
filter = flipud(filter);

% Multiplying matrix of coefficients with filter to retain only largest K^2
% coefficients
k_coeff=blockproc(coeff,[8, 8],@(block_struct)block_struct.data.*filter);

end