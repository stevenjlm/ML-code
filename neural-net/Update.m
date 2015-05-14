% 
%     ECE 594E HW 4
%           Neural Network
%     Update Parameters
%
%     In:  nLayers  -> scalar # of layers
%          W        -> nLayer-1 entry cell of weight matrices
%          a        -> nLayer entry cell of neuron activations
%          delW     -> nLayer-1 entry cell of weight gradient matrices
%          delb     -> nLayer-1 entry cell of scalar bias gradient terms
%          class    -> boolean which class
%
%     Out: delW     -> nLayer-1 entry cell of weight gradient matrices
%          delb     -> nLayer-1 entry cell of scalar bias gradient terms

function [W,b]= Update (nLayers,W,b,delW,delb,nDataPts,alpha,lambda)
    % Update layer by layer
    for iLayer=1:(nLayers-1)
        W{iLayer}=W{iLayer}-alpha*(1/nDataPts*delW{iLayer}...
            +lambda*W{iLayer});
        
        b{iLayer}=b{iLayer}-alpha*(1/nDataPts*delb{iLayer});
    end
end