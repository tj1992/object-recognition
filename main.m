close all;

% Number of patches to be extracted
numPatches = 10000;

% Patch size
patchSize = 6;

% Dimension of data: 32 x 32 pixels x 3 for RGB
CIFAR_DIM = [ 32 32 3 ];

%% Load CIFAR training data
fprintf('Loading training data...\n');

[ trainX, trainY ] = loadTrainingData(10000);

X = convert2Gray(trainX);

%---DEMO PART---%
% This code is here only for demonstration and visualization purposes.
% Please do not remove.
% Rather comment it if you don't need it.

fprintf('Images (without normalization)...\n');
displayData(X(1:10,:));
pause;

fprintf('Images (with normalization)...\n');
figure;
Y = normalize(X);
displayData(Y(1:10,:));

%---END OF DEMO---%

% extract random patches
%% NOTE/TODO: Explain the process in comments.

patches = zeros(numPatches, patchSize*patchSize*3);
for i=1:numPatches
  if (mod(i,10000) == 0)
 	fprintf('Extracting patch: %d / %d\n', i, numPatches);
  end
  
  %{
  r = random('unid', CIFAR_DIM(1) - patchSize + 1);%unid is uniform discrete distribution
  c = random('unid', CIFAR_DIM(2) - patchSize + 1);
  %}
  r = randi(CIFAR_DIM(1) - patchSize + 1);
  c = randi(CIFAR_DIM(2) - patchSize + 1);
  patch = reshape(trainX(mod(i-1,size(trainX,1))+1, :), CIFAR_DIM);	% ??
  patch = patch(r:r+patchSize-1,c:c+patchSize-1,:);			% ??
  patches(i,:) = patch(:)';
end


