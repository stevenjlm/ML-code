% 
%     HW#3 ECE 594E
%           Neural Network
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
		result=ForwardProp(nLayers,W,b,z,a,[Xp(iPlot,jPlot),Yp(iPlot,jPlot)]);
        Zp(iPlot,jPlot) = sigmoid(result{4});
    end
end
contourf(Xp,Yp,Zp,[.5 .5],'ShowText','on');

DatatoPlot=TestData;

% Plot data points
hold on;
for iDataPt=1:nDataPts/2
	if (DatatoPlot(iDataPt,3)==0)
		plot(DatatoPlot(iDataPt,1),DatatoPlot(iDataPt,2),'xb');
	else
		plot(DatatoPlot(iDataPt,1),DatatoPlot(iDataPt,2),'+r');
	end
end

hold off;

title('K=8,6 \alpha=0.1 \lambda=.01 Decision Boundary');
