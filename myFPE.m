function [FPE] = myFPE(y,theta)

N = length(y);
n = length(theta);

J = myCostFunc(y,theta);

% FPE = J+((2*2*n)/N)*J;  %ARX
FPE = J+((2*n)/N)*J;    %AR

end

