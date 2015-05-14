% 
%     ECE 594E HW 4
%           Neural Network
%     Objective Function
%
%     In:  nLayers  -> scalar # of layers
%          W        -> nLayer-1 entry cell of weight matrices
%          b        -> nLayer-1 entry cell of scalar bias terms
%          z        -> nLayer entry cell of neuron activation probabilities
%          a        -> nLayer entry cell of neuron activations
%          Data     -> nDataPts/2 by 3 matrix of data pt and class
%          lambda   -> scalar regularization factor
%
%     Out: z        -> nLayer entry cell of neuron activation probabilities
%          a        -> nLayer entry cell of neuron activations

function J = ObjFn(nLayers,W,b,z,a,Data,lambda)
nDataPts=size(Data,1);
J=0;

% First objective function term
for iDataPt=1:nDataPts
    % Set inputs to neurons
    a{1}=Data(iDataPt,1:2)';
    
    % Progress through propagation, layer by layer
    for iLayer=1:(nLayers-1)
        z{iLayer+1}=W{iLayer}*a{iLayer}+b{iLayer};
        a{iLayer+1}=sigmoid(z{iLayer+1});
    end
    
    J=J+1/2*(round(a{nLayers})-Data(iDataPt,3))^2;
end

% Second Objective function term
for iLayer=1:(nLayers-1)
        J=J+lambda/2*sum(sum(W{iLayer}.^2));
end

end