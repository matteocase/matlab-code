function [MDL] = myMDL(y,theta)

N = length(y);
n = length(theta);
J = myCostFunc(y,theta);

% MDL = N*log(J)+2*2*n*log(N);    %ARX
MDL = N*log(J)+2*n*log(N);        %AR

end

