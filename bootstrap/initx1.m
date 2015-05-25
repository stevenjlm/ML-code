% 
%     ECE 594E HW 4
%           Bootstrap particle filter
%     Initialize state x_{1}

function x= initx1 ( Model)
x=normrnd(Model.muXini, Model.sigmaXini, Model.N);
end
