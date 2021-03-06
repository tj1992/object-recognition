function [X_norm] = normalize(X, dim)
% NORMALIZE Normalize the data (subtract by mean and divide by std. deviation).
%	[X_norm] = NORMALIZE(X) operates on each column of matrix X and subtracts
%	each element of it by mean of it and divides the result by square root
%	of variance + 10. In other words,
%                          X(i, j) - mean(X(:,j))
%          X_norm(i, j) = ----------------------- ; for row i and column j.
%			   sqrt(var(X(:,j)+10)

% Sensible default for dim
if ~exist('dim', 'var') || isempty(dim)
	dim = 1;
end;

% Calculate mean and variance along dim
mu = mean(X, dim);
sigma = sqrt(var(X, 1, dim) + 10);

X_norm = bsxfun(@rdivide, bsxfun(@minus, X, mu), sigma);

end;
