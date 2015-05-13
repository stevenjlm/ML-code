% 
%     HW#3 ECE 594E
%           Kernalized Logistic Regression
%     Plot Data
%     Parameters: l -> hyperparameter
%            lambda -> regularization parameter
%                ns -> Number of training samples to take per class
%             steps -> Number of steps to complete

%     Steven Munn

ns=200;

N=2*ns;

figure;
% Plot boundry
step=.1;
xp = -8:step:8;
yp = -8:step:8;
[Xp,Yp] = meshgrid(xp,yp);
Zp=zeros(size(Xp));
for iPlot=1:size(Xp,1)
    for jPlot=1:size(Xp,2)
        Zp(iPlot,jPlot) = a'*Kernel(X,[Xp(iPlot,jPlot);Yp(iPlot,jPlot)],l);
    end
end
contourf(Xp,Yp,Zp,[0 0],'ShowText','on');

% Plot data points
hold on;
% t=1 points
plot(X(1,1:ns),X(2,1:ns),'*');
% t=0 points
plot(X(1,ns+1:N),X(2,ns+1:N),'+');

hold off;

title('K=25 l=0.1 \lambda=15 Decision Boundary');
