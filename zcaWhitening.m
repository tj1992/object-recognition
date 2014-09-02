function Xwhite = zcaWhitening(X, epsilon)
% ZCAWHITENING Perform a ZCA whitening transform on X
%	Xwhite = ZCAWHITENING(X, epsilon) returns the ZCA transform of
%	X in Xwhite. epsilon is the ZCA regularization parameter.
%

% Sensible default for epsilon
if ~exist('epsilon', 'var') || isempty(epsilon)
	epsilon = 1;
end;

% Eigen decomposition
[ U S V ] = svd(X' * X / size(X,1));

% ZCA transform
Xwhite = X * (bsxfun(@rdivide, U, sqrt(diag(S)'+epsilon)) * U');

end;
