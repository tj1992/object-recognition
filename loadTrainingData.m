function [X, y, msg] = loadTrainingData(dataSize)
% LOADTRAININGDATA Load the CIFAR-10 training data from the .mat files
% 	[X, y, msg]  = LOADTRAININGDATA(dataSize) loads the training data
%	from .mat files into "X" and "y", where "X" is the data matrix of size:
%	dataSize(defaults to 50000) x 3072 (32x32x3) and "y" is the label
% 	matrix of size: dataSize(defaults to 50000) x 1.
%	If loading fails for some reason, both "X" and "y" are set to empty
%	matrix and "msg" is set with appropriate error message.

% Define the path to CIFAR data folder
CIFAR_DIR = [ pwd() '/cifar-10-batches-mat/' ];

% set some defaults
if ~exist('dataSize', 'var') || isempty(dataSize)
	dataSize = 50000;
end;

X = [];
y = [];
msg = '';

if dataSize < 1 || dataSize > 50000
	msg = 'Error: Invalid argument: dataSize should be in range [1,50000].';
	return
end;

for i = 1:ceil(dataSize/10000)		% get data in chunks of 10000
	fname = [ CIFAR_DIR 'data_batch_' '0'+i '.mat' ];
	if ~exist(fname)
		X = [];
		y = [];
		msg = [ 'Error: File "' fname '" does not exist.' ];
		return;
	end;
	F = load(fname);
	X = [ X; F.data ];
	y = [ y; F.labels ];
end;

if size(X, 1) != dataSize
	% Resize to required size
	X = X(1:dataSize, :);
	y = y(1:dataSize, :);
end;

y = y + 1;	% Add 1 to make the range [1,10] (easier to handle during prediction)

end;
