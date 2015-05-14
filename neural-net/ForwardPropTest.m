% 
%     ECE 594E HW 4
%           Neural Network
%     Forward Propagation
%
%     In:  nLayers  -> scalar # of layers
%          W        -> nLayer-1 entry cell of weight matrices
%          b        -> nLayer-1 entry cell of scalar bias terms
%          z        -> nLayer entry cell of neuron activation probabilities
%          a        -> nLayer entry cell of neuron activations
%          DataPt   -> 1 by 2 row vector of data pt and class
%          class    -> boolean which class
%
%     Out: z        -> nLayer entry cell of neuron activation probabilities
%          a        -> nLayer entry cell of neuron activations

function delta= ForwardPropTest(nLayers,W,b,z,a,DataPt,class)
% Set inputs to neurons
a{1}=DataPt';

% Progress through propagation, layer by layer
for iLayer=1:(nLayers-1)
    z{iLayer+1}=W{iLayer}*a{iLayer}+b{iLayer};
    a{iLayer+1}=sigmoid(iLayer+1);
end

delta=-bsxfun(@plus,class,-a{nLayers}).*fPrime;
end