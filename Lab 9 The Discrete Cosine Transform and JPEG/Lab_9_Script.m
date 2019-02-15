% Lab 9 Script

%% 1.1

%% 1.2

K = 4;
image = 'imgA_prenoise.png';
%img = double(imread(image));
[k_coeff,patches,coeff] = img_compression(image,K);

%% 1.3

K = 4;
image = 'imgA_prenoise.png';
%img = double(imread(image));
[k_coeff,patches, coeff] = img_compression_DCT(image,K);

%% 1.4

image = 'imgA_prenoise.png';
[X] = img_quantization(image);

%% 1.5

% Image reconstruction with DCT
K = 64;
image = 'imgA_prenoise.png';
[k_coeff,patches, coeff] = img_compression_DCT(image,K);
[iDCT] = img_reconstruction(k_coeff);

% Image reconstruction with quantization
[XQ] = img_quantization(image);
[iDCT_Q] = img_reconstruction(XQ);

