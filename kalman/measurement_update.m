% 
%     ECE 594E HW 4
%           Kalman particle filter
%     Measurement Update

function [x,P]=measurement_update(Model,Filter)
xt_tm1=Filter.xs(Filter.t,:); % b/c time update was done first
yt=Filter.ys(Filter.t,:);
Kt=Filter.Ps(Filter.t,:)*.5/(.5^2*Filter.Ps(Filter.t,:)+Model.sigmaEt);

x=xt_tm1+Kt*(yt-.5*xt_tm1);

Pt=Filter.Ps(Filter.t,:);
P=Pt-Kt*.5*Pt;
end