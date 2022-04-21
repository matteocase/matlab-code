function [theta] = myRLS_I(y,u,n)

N = length(y)-n;
theta = zeros(2*n,1);
% R = eye(2*n)*1;
alpha = 1;
S = eye(2*n)/alpha;

for t = (n+1):(N+n)

    % per each iteration of the for-cycle I'm assigning the three elements
    % of y and u in reversed order to the vectors Vy and Vu, so that these
    % can be linked to form the proper column-vector phi at each t;
    
    Vy = flipud(y((t-n):(t-1)));  
    Vu = flipud(u((t-n):(t-1)));    
    phi = vertcat(-Vy,Vu);
    
    % The following computations are the four steps of the RLS_1 algorithm
    % presented in the slides;
   
    S = S+(phi*phi');                 % 1.  
    K = (S^(-1))*phi;                 % 2.
    epsilon = y(t)-(phi'*theta);      % 3. 
    theta = theta+(K*epsilon);        % 4. 
    
end

end