% 
%     ECE 594E HW 4
%           Neural Network
%     Sigmoid function
%
%     In:       z  -> n by m Matrix or scalar
%
%     Out:      fz -> n by m Matrix or scalar

function fz = sigmoid(z)
fz=1./(1+exp(-z));
end