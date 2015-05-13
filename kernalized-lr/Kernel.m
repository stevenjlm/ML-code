% 
%     HW#3 ECE 594E
%           Kernalized Logistic Regression
%     Kernel Matrix
%     Parameters: X_a -> d by n Training data
%                 X_b -> d by m Data matrix
%                   l -> scalar hyperparameter
%             
%     Outputs:      K -> n by m Kernel matrix

function K=Kernel(Xa,Xb,l)

% For loop implementation
n=size(Xa,2);
m=size(Xb,2);

% Init return vars
K=zeros(n,m);

for i=1:n
    for j=1:m
        %      k(X_a(i),X_b(j))
        K(i,j)=KernelFunction(Xa(:,i),Xb(:,j),l);
    end
end

end