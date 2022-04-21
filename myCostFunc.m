function [J] = myCostFunc(y,theta)

N = length(y);
n = length(theta);

H = -myHank(y,n);
J = (1/(N-n))*(y(n+1:end)-H*theta)'*(y(n+1:end)-H*theta);

end

