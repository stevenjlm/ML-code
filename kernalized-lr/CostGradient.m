% 
%     HW#3 ECE 594E
%           Kernalized Logistic Regression
%     Cost function Gradient
%     Parameters:    t -> N by 1 Training data classes {0,1}
%                    a -> N by 1 Learning parameters
%                    X -> d by N Training data
%                    y -> N by 1 Classification probabilities
%                    l -> scalar hyperparameter
%               lambda -> scalar
%             
%     Outputs: DelEmap -> N by 1 Cost function gradient

function DelEmap = CostGradient(t,a,X,y,l,lambda)

% MAP cost function gradient
% N by 1
DelEmap=Kernel(X,X,l)*(y-t+lambda*a);
end