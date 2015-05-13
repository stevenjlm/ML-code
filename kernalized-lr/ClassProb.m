% 
%     HW#3 ECE 594E
%           Kernalized Logistic Regression
%     Classification probabilities
%     Parameters: a -> N by 1 Learning parameters
%                 X -> d by N Training data
%                 l -> scalar hyperparameter
%             
%     Outputs:    y -> N by 1 Classification prob
%                 z -> N by 1 Classification LLR

function [y,z]=ClassProb(a,X,l)
% For loop implementation
N=size(X,2);

% Init return vars
z=zeros(N,1);
y=zeros(N,1);

for i=1:N
    %       K(X,x_i)
    z(i)=a'*Kernel(X,X(:,i),l);
    %    \sigma(z_i)
    y(i)=1/(1+exp(-z(i)));
end
end