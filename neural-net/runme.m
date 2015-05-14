% 
%     ECE 594E HW 4
%           Neural Network
%     Main running script
%     Parameters: nLayers  -> number of neural network layers
%                          -> including in and out layers
%                 nNeurons -> nLayers by 1 vector with # of neurons in
%                          -> each layer
%                 
%
%     Steven Munn
%           from https://github.com/stevenjlm/ML-code

clear; clc;

% Script parameters
nLayers=3;
nNeurons=[2;8;1];
nEpochs=30;
nDataPts=10; % MUST BE DIVISIBLE BY 2
if ~isequal([nLayers,1],size(nNeurons))
    error('nNeurons should be an nLayers by 1 column vector');
end

% Initialization ------------------------

[W,b,z,a,delW,delb]=InitParams(nLayers, nNeurons);

% Load Data -----------------------------
Data=LoadData(nDataPts);

% Shuffle Data
ordering = randperm(nDataPts);
Data=Data(ordering,:);

% Learn ---------------------------------
for iEpoch=1:nEpochs
    for iDataPt=1:nDataPts
        [z,a]= ForwardProp (nLayers,W,b,z,a,Data(iDataPt,1:2));
        [z,a]= BackProp (nLayers,W,b,z,a,Data(iDataPt,1:2));
    end
end