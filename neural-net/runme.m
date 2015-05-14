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
nEpochs=1;
nDataPts=200; % must be divisible by 2
alpha=.001;
lambda=.1;
checkGradient=1;

% Initialization ------------------------

[W,b,z,a,delW,delb]=InitParams(nLayers, nNeurons);

% Load Data -----------------------------
Data=LoadData(nDataPts);

% Shuffle Data
ordering = randperm(nDataPts);
Data=Data(ordering,:);

% Seperate training from Test data
TrainData=Data(1:nDataPts/2,:);
TestData=Data(nDataPts/2+1:end,:);

% Learn ---------------------------------
for iEpoch=1:nEpochs
    for iDataPt=1:nDataPts/2
        [z,a]= ForwardProp (nLayers,W,b,z,a,TrainData(iDataPt,1:2));
        [delW,delb]= BackProp (nLayers,W,a,delW,delb,TrainData(iDataPt,3));
    end
    
    if checkGradient==1
        CheckGrad(nLayers,nNeurons,W,b,z,a,delW,delb,TrainData,lambda);
    end
    
    [W,b]= Update (nLayers,W,b,delW,delb,nDataPts/2,alpha,lambda);
    J= ObjFn (nLayers,W,b,z,a,TrainData,lambda);
    %disp(J);
end

TotalError=0;
% Test
for iDataPt=1:nDataPts/2
    delta=ForwardPropTest(nLayers,W,b,z,a,...
        TestData(iDataPt,1:2),TestData(iDataPt,3));
    TotalError=TotalError+delta;
end

disp('Error percentage rate is:');
disp(TotalError/(nDataPts/2)*100);