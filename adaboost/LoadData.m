% 
%     ECE 594E HW 4
%           Neural Network
%     Load Data in Matrix
%
%     In:  nDataPts -> number of data points
%          mapzeros -> boolean: map zeros to negatives?
%
%     Out: Data     -> nDataPts by 2 matrix of data

function Data=LoadData(nDataPts,mapZeros)

if mod(nDataPts,2)==1
    error('nDataPts must be divisible by two');
end

load('data/hw3_class0.mat');
load('data/hw3_class1.mat');

if ~mapZeros
    Data=[samples_class0(1:nDataPts/2,:),zeros(nDataPts/2,1)];
    Data=[Data;[samples_class0(1:nDataPts/2,:),ones(nDataPts/2,1)]];
else
    Data=[samples_class1(1:nDataPts/2,:),-ones(nDataPts/2,1)];
    Data=[Data;[samples_class0(1:nDataPts/2,:),ones(nDataPts/2,1)]];
end

end