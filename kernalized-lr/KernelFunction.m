% 
%     HW#3 ECE 594E
%           Kernalized Logistic Regression
%     Kernel function
%     Parameters: x1 -> d by 1 data vector
%                 x2 -> d by 1 data vector
%                  l -> scalar hyperparameter
%             
%     Outputs:     k -> scalar kernel value

function k=KernelFunction(x1,x2,l)
k=exp(-norm(x1-x2)^2/(2*l^2));
end