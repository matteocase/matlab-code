% Hankel matrix generator
% function H = hank(X,n)
% s --> data vector
% n --> order

function H = myHank(s,n)
N = length(s);

H = zeros(N-n,n);

for k = 1:n                          % passing through the cols of H(h,k)
    for h = 1:(N-n)                  % passing through the rows of H(h,k)
        H(h,k) = s(n+h-k,1);         % filling up H(h,k) columnwise-ly
    end
end





