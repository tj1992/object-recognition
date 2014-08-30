%defines the path to cifar folder
CIFAR_DIR='/home/tushar/src/object/cifar-10-batches-mat/';


%number of patches to be extracted
numPatches = 100000;

rfSize = 6;

%dimensions of image 32*32*3(3 for RGB)
CIFAR_DIM=[32 32 3];

%% Load CIFAR training data

fprintf('Loading training data...\n');
f1=load([CIFAR_DIR '/data_batch_1.mat']);
f2=load([CIFAR_DIR '/data_batch_2.mat']);
f3=load([CIFAR_DIR '/data_batch_3.mat']);
f4=load([CIFAR_DIR '/data_batch_4.mat']);
f5=load([CIFAR_DIR '/data_batch_5.mat']);


trainX = double([f1.data; f2.data; f3.data; f4.data; f5.data]);
trainY = double([f1.labels; f2.labels; f3.labels; f4.labels; f5.labels]) + 1; % add 1 %%to labels!
clear f1 f2 f3 f4 f5;

% extract random patches
patches = zeros(numPatches, rfSize*rfSize*3);
for i=1:numPatches
  if (mod(i,10000) == 0)
 	fprintf('Extracting patch: %d / %d\n', i, numPatches);
  end
  
  r = random('unid', CIFAR_DIM(1) - rfSize + 1);%unid is uniform discrete distribution
  c = random('unid', CIFAR_DIM(2) - rfSize + 1);
  patch = reshape(trainX(mod(i-1,size(trainX,1))+1, :), CIFAR_DIM);
  patch = patch(r:r+rfSize-1,c:c+rfSize-1,:);
  patches(i,:) = patch(:)';
end


