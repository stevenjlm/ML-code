% 
%     ECE 594E HW 4
%           Neural Network
%     Back Propagation
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

function [delW,delb]= BackProp (nLayers,W,a,delW,delb,class)
% Error variable:
delta=a;

% % Partial Derivatives
% patialW=cell(1,nLayers-1);
% for iLayer=1:(nLayers-1)
%     partialW{iLayer}=zeros(nNeurons(iLayer+1),nNeurons(iLayer));
% end
% partialb=cell(1,nLayers-1);
% for iLayer=1:(nLayers-1)
%     partialb{iLayer}=zeros(nNeurons(iLayer+1),1);
% end

% Set error on output layer
fPrime=a{nLayers}.*(1-a{nLayers});
delta{nLayers}=-bsxfun(@plus,class,-a{nLayers}).*fPrime;

% Progress through propagation, layer by layer
for iLayer=(nLayers-1):-1:1
    % Compute errors
    fPrime=a{iLayer}.*(1-a{iLayer});
    delta{iLayer}=(W{iLayer}'*delta{iLayer+1}).*fPrime;
    
    % Partial Derivatives
    partialW{iLayer}=delta{iLayer+1}*a{iLayer}';
% 	disp('error for');
% 	disp(iLayer);
% 	disp(partialW{iLayer});
    partialb{iLayer}=delta{iLayer+1};
    
    % Cummulative change
    delW{iLayer}=delW{iLayer}+partialW{iLayer};
    delb{iLayer}=delb{iLayer}+partialb{iLayer};
end

end