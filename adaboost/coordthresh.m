% 
%     ECE 594E HW 4
%           Adaptive Boosting
%     Test coordinate threshold
%                 
%
%     Steven Munn
%           from https://github.com/stevenjlm/ML-code

A=3*rand(10,2)-3;
B=3*rand(10,2)+3;

plot(A,'xb');
hold on
plot(B,'+b');
hold off

% means
mA=mean(A);
mB=mean(B);

