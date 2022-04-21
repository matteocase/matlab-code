function [AIC] = myAIC(y,theta)

N = length(y);
n = length(theta);
J = myCostFunc(y,theta);

% AIC = N*log(J)+2*2*n;   %ARX
AIC = N*log(J)+2*n;     %AR

end

