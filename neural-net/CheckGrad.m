% 
%     ECE 594E HW 4
%           Neural Network
%     Check Gradient
%
%     In:  nLayers  -> scalar # of layers
%          nNeurons -> nLayers by 1 # of neurons per layer
%          W        -> nLayer-1 entry cell of weight matrices
%          b        -> nLayer-1 entry cell of scalar bias terms
%          z        -> nLayer entry cell of neuron activation probabilities
%          a        -> nLayer entry cell of neuron activations
%          delW     -> nLayer-1 entry cell of weight gradient matrices
%          delb     -> nLayer-1 entry cell of scalar bias gradient terms
%          Data     -> nDataPts/2 by 3 matrix of data pt and class
%          lambda   -> scalar regularization factor
%
%     Out: z        -> nLayer entry cell of neuron activation probabilities
%          a        -> nLayer entry cell of neuron activations

function CheckGrad(nLayers,nNeurons,W,b,z,a,delW,delb,Data,lambda)

% Loop through the weight parameters
for iLayer=1:nLayers-1
    for iNeuronx=1:nNeurons(iLayer+1)
        for iNeurony=1:nNeurons(iLayer)
            WepPlus=W;
            WepPlus{iLayer}(iNeuronx,iNeurony)=...
                W{iLayer}(iNeuronx,iNeurony)+10^(-3);
            WepMinus=W;
            WepMinus{iLayer}(iNeuronx,iNeurony)=...
                W{iLayer}(iNeuronx,iNeurony)-10^(-3);
            
            g=1/(2*10^(-3))*(ObjFn(nLayers,WepPlus,b,z,a,Data,lambda)...
                -ObjFn(nLayers,WepMinus,b,z,a,Data,lambda));
            disp(g);
            disp(delW{iLayer}(iNeuronx,iNeurony));
        end
    end
end

% Loop through biases
for iLayer=1:nLayers-1
    for iNeuron=1:nNeurons(iLayer+1)
        bepPlus=b;
        bepPlus{iLayer}(iNeuron)=b{iLayer}(iNeuron)+10^(-3);
        bepMinus=b;
        bepMinus{iLayer}(iNeuron)=b{iLayer}(iNeuron)+10^(-3);
        
        g=1/(2*10^(-3))*(ObjFn(nLayers,W,bepPlus,z,a,Data,lambda)...
                -ObjFn(nLayers,WepMinus,bepMinus,z,a,Data,lambda));
        disp(g);
        disp(delb{iLayer}(iNeuron));
    end
end
end