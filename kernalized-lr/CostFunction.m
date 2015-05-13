% 
%     HW#3 ECE 594E
%           Kernalized Logistic Regression
%     MAP cost function
%     Parameters: y -> N by 1 Classification probabilities
%                 t -> N by 1 Training data classes {0,1}
%                 a -> N by 1 Learning parameters
%                 X -> d by N Training data
%            lambda -> scalar
%                 l -> scalar hyperparameter
%             
%     Outputs: Emap -> scalar

function Emap = CostFunction(y,t,a,X,lambda,l)

% Summation term
% N by 1
SumTerm=t.*log(y)+(1-t).*log(1-y);

% Constraint term
% scalar
CTerm=lambda/2*a'*Kernel(X,X,l)*a;

% MAP cost function
% scalar
Emap=-sum(SumTerm)+CTerm;

end