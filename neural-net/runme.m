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

% Parameters
nLayers=3;
nNeurons=[2;8;1];
backPropSteps=30;

% Initialization ------------------------

if ~isequal([nLayers,1],size(nNeurons))
    error('nNeurons should be an nLayers by 1 column vector');
end

% Weights
W=cell(1,nLayers-1);
for iLayer=1:(nLayers-1)
    W{iLayer}=rand(nNeurons(iLayer+1),nNeurons(iLayer));
end

% Biases
b=cell(1,nLayers-1);
for iLayer=1:(nLayers-1)
    b{iLayer}=rand(nNeurons(iLayer+1),1);
end

% z
z=cell(1,nLayers);
for iLayer=1:(nLayers)
    b{iLayer}=zeros(nNeurons(iLayer),1);
end

% a
a=cell(1,nLayers);
for iLayer=1:(nLayers)
    a{iLayer}=zeros(nNeurons(iLayer),1);
end

% Gradients
delW=cell(1,nLayers-1);
for iLayer=1:(nLayers-1)
    W{iLayer}=zeros(nNeurons(iLayer+1),nNeurons(iLayer));
end
delb=cell(1,nLayers-1);
for iLayer=1:(nLayers-1)
    b{iLayer}=zeros(nNeurons(iLayer+1),1);
end

