%% 1.2 Image Compression
for Ks = [4,16,32,64]
    A = imread('imgA_prenoise.png');
    mat = twoD_compression(A, Ks);
    figure;
    imshow(mat2gray(abs(mat)));
end
%% 1.3
for Ks = [4,16,32,64]
    A = imread('imgA_prenoise.png');
    A = double(A);
    mat = twoDct_compression(A, Ks);
    figure;
    imshow(mat2gray(abs(mat)));
end
%% 1.4
for Ks = [4,16,32,64]
    A = imread('imgA_prenoise.png');
    A = double(A);
    mat = twoDct_quantize(A, Ks);
    %X = twoDct_compression(A, Ks);
    %mat = twoDct_qUnSpec(X, Ks);
    figure;
    imshow(mat2gray(abs(mat)));
    energy = norm(A)^2 - norm(mat)^2
end