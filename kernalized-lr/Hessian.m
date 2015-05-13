% 
%     HW#3 ECE 594E
%           Kernalized Logistic Regression
%     Hessian Matrix
%     Parameters: X -> d by N Training data
%                 y -> N by 1 Classification prob
%            lambda -> scalar
%                 l -> scalar hyperparameter
%             
%     Outputs:    H -> N by N Hessian Matrix

function H=Hessian(X,y,lambda,l)

R=diag(y.*(1-y));

% First term
% N by N
FTerm=Kernel(X,X,l)*R*Kernel(X,X,l);

% Constraint term
% N by N
CTerm=lambda*Kernel(X,X,l);

% Hessian
H=FTerm+CTerm;
end
