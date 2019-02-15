function [iDCT] = img_reconstruction(X)

[N,~] = size(X);

iDCT = blockproc(X,[8,8],@(block_struct)my2DiDCT(block_struct.data));
iDCT = (iDCT*2)/N;

end