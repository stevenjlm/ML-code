% 
%     ECE 594E HW 4
%           Neural Network
%     Tanh function
%
%     In:       z  -> n by m Matrix or scalar
%
%     Out:      fz -> n by m Matrix or scalar

function fz = tanhyp(z)
fz=(exp(z)-exp(-z))./(exp(z)+exp(-z));
end