function patches = extractPatches(X, patchSize, numPatches)
% extract random patches
%% NOTE/TODO: Explain the process in comments.

patches = zeros(numPatches, patchSize*patchSize);
[ dim1 dim2 ] = size(X);
imSize = round(sqrt(dim2));

for i=1:numPatches
  r = randi(imSize - patchSize + 1);
  c = randi(imSize - patchSize + 1);
  %{
  r = random('unid', CIFAR_DIM(1) - patchSize + 1);%unid is uniform discrete distribution
  c = random('unid', CIFAR_DIM(2) - patchSize + 1);
  %}
  patch = reshape(X(mod(i-1,dim1)+1, :), [ imSize imSize ]);	% ??
  patch = patch(r:r+patchSize-1, c:c+patchSize-1);
  patches(i,:) = patch(:)';
end;

end;
