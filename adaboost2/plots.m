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
        Zp(iPlot,jPlot) = hx(h,[Xp(iPlot,jPlot),Yp(iPlot,jPlot)],hWeights,nClassifiers);
    end
end
contourf(Xp,Yp,Zp,[0 0],'ShowText','on');

DatatoPlot=[TestData0;TestData1];

% Plot data points
hold on;
for iDataPt=1:100
	if (DatatoPlot(iDataPt,3)==-1)
		plot(DatatoPlot(iDataPt,1),DatatoPlot(iDataPt,2),'xb');
	else
		plot(DatatoPlot(iDataPt,1),DatatoPlot(iDataPt,2),'+r');
	end
end

hold off;

title('Adaboost Decision Boundary');
