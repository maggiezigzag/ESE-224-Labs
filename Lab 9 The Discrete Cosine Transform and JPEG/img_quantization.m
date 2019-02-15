function [X] = img_quantization(image)

% Loading and converting image into type double
img = double(imread(image));
% Performs my2D_DCT on each block
X=blockproc(img,[8, 8],@(block_struct)my2D_DCT(block_struct.data));
% Quantization matrix Q for JPEG compression
Q = [16 11 10 16 24 40 51 61; 12 12 14 19 26 58 60 55; 14 13 16 24 40 57 69 56; ...
    14 17 22 29 51 87 80 62; 18 22 37 56 68 109 103 77; 24 36 55 64 81 104 113 92; ...
    49 64 78 87 103 121 120 101; 72 92 95 98 112 100 103 99];
X = blockproc(X,[8,8],@(block_struct)round(block_struct.data/Q));

end