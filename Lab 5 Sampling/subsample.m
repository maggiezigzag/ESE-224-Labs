function [xs, xd] = subsample(x,Ts,Tss)

fs = 1/Ts;
fss = 1/Tss;

% Ratio for sampling and subsampling
ratio = fs/fss;

% Subsampling
xs = downsample(x,ratio);

% Delta train representation
xd = upsample(xs,ratio);
xd = xd(1:length(x));

end

