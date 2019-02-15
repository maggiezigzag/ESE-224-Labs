function [x,y,z,X,Y] = gaussPulse2D(mu, sigma, Ts)

% Creating meshgrid
x=-3*sigma:Ts:3*sigma;
y = x';
[X,Y]=meshgrid(x,y);

% Generating 2D Gaussian Pulse
z   = zeros(size(X));
for i = 1:size(mu,1)
     z= z + exp(-((X-mu).^2+(Y-mu).^2)/( 2*sigma^2) );
end

end