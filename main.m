clc;
close all;

dataSize = 1000;

%% Load CIFAR training data
fprintf(stderr, 'Loading training data...\n');

[ trainX, trainY ] = loadTrainingData(dataSize);

X = convert2Gray(trainX);	% size(X) = [dataSize 1024]

%----------------------------------------------------------------------
%---DEMO PART---%
%----------------------------------------------------------------------
% This code is here only for demonstration and visualization purposes.
% Please do not remove.
% Rather comment it if you don't need it.

fprintf('Images (without normalization)...\n');
displayData(X(1:20,:));

fprintf('Images (with normalization)...\n');

X_norm = normalize(X, 2);

figure;
displayData(X_norm(1:20,:));

fprintf('Images (with whitening)...\n');

X_white = zcaWhitening(X_norm);

figure;
displayData(X_white(1:20,:));
figure;

%----------------------------------------------------------------------
%---END OF DEMO---%
%----------------------------------------------------------------------

% Number of patches to be extracted
numPatches = 10000;

% Patch size
patchSize = 6;

fprintf(stderr, 'Extracting patches...\n');
% Extract the patches
patches = extractPatches(X, patchSize, numPatches);	% size(patches) = [numPatches patchSize*patchSize]

fprintf(stderr, 'Normalizing patches...\n');
% Normalize the patches
normPatches = normalize(patches, 2);

fprintf(stderr, 'Applying ZCA transform...\n');
% Apply PCA whitening algorithm
whitePatches = zcaWhitening(normPatches);

% DEMO
displayData(whitePatches(1:50,:));
