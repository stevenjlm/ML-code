% 
%     ECE 594E HW 4
%           Kalman particle filter
%     Time Update

function [x,P]=time_update(Model,Filter)
xt=Filter.xs(Filter.t-1,:);
ut=Filter.us(Filter.t-1,:);
x=1/2*xt+1/2*ut;

Pt=Filter.Ps(Filter.t-1,:);
P=.5^2*Pt+Model.sigmaXs;
end