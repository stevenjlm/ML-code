% 
%     ECE 594E HW 4
%           Neural Network
%     Load Data in Matrix
%
%     In:  nDataPts -> Number of data points
%
%     Out: Data     -> nDataPts by 2 matrix of data

function Data=LoadData(nDataPts)

if mod(nDataPts,2)==1
    error('nDataPts must be divisible by two');
end

load('data/hw3_class0.mat');
load('data/hw3_class1.mat');

Data=[samples_class0(1:nDataPts/2,:),zeros(nDataPts/2,1)];
Data=[Data;[samples_class0(1:nDataPts/2,:),ones(nDataPts/2,1)]];

end