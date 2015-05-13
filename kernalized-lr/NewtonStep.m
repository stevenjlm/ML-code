% 
%     HW#3 ECE 594E
%           Kernalized Logistic Regression
%     Newton update
%     Parameters: a -> N by 1 Learning params
%                 H -> N by N Hessian matrix
%           DelEmap -> N by 1 Cost function gradient
%             
%     Outputs:    a(k+1) -> N by 1 learning parameters

function aNext=NewtonStep(a,H,DelEmap)
% N by 1
aNext=a-pinv(H)*DelEmap;
end