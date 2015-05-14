% 
%     ECE 594E HW 4
%           Neural Network
%     Initialize all the learning parameters
%
%     In:  nLayers  -> scalar # of layers
%          nNeurons -> nLayers by 1 # of neurons per layer
%
%     Out: W        -> nLayer-1 entry cell of weight matrices
%          b        -> nLayer-1 entry cell of scalar bias terms
%          z        -> nLayer entry cell of neuron activation probabilities
%          a        -> nLayer entry cell of neuron activations
%          delW     -> nLayer-1 entry cell of weight gradient matrices
%          delb     -> nLayer-1 entry cell of scalar bias gradient terms

function [W,b,z,a,delW,delb]=InitParams(nLayers, nNeurons)

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

end