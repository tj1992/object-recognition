function [X_gray] = convert2Gray(X)
% CONVERT2GRAY Converts the RGB matrix X to grayscale
%	[X_gray] = CONVERT2GRAY(X) converts the RGB matrix X to
%	grayscale, where X is 2D matrix with dimension 2 of size
%	NxNx3. Grayscale value = (R+G+B)/3.

X_gray = mean(reshape(X, [size(X,1) size(X,2)./3 3]), 3);

end;
