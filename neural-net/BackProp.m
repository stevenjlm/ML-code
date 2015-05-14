% 
%     ECE 594E HW 4
%           Neural Network
%     Back Propagation
%
%     In:  nLayers  -> scalar # of layers
%          W        -> nLayer-1 entry cell of weight matrices
%          b        -> nLayer-1 entry cell of scalar bias terms
%          z        -> nLayer entry cell of neuron activation probabilities
%          a        -> nLayer entry cell of neuron activations
%          DataPt   -> 1 by 2 row vector of data pt and class
%
%     Out: z        -> nLayer entry cell of neuron activation probabilities
%          a        -> nLayer entry cell of neuron activations
%          

function [z,a]= BackProp(nLayers,W,b,z,a,DataPt)
% Set inputs to neurons
a{1}=DataPt';

% Progress through propagation, layer by layer
for iLayer=1:nLayers
    z{iLayer+1}=W{iLayer}*a{iLayer}+b{iLayer};
    a{iLayer+1}=sigmoid(iLayer+1);
end

end