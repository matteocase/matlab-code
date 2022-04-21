function [theta] = myLS(y,u,n)

N = length(y)-n;
theta = zeros(2*n,1);

Hu = myHank(u,n); 
Hy = myHank(y,n); 

% H = [-Hy;Hu];
H = horzcat(-Hy,Hu);       % H = [Hy | Hu]

% [theta] = ((1/N)*(H'*H))^(-1)*((1/N)*H'*y(n+1:end));
[theta] = (H'*H)^(-1)*(H'*y(n+1:end));

end


