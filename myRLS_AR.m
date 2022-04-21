function [theta] = myRLS_AR(y,n)

N = length(y)-n;
theta = zeros(n,1);
% R = eye(2*n)*1;
alpha = 1;
S_inv = eye(n)/alpha;

for t = (n+1):(N+n)
    
    % per each iteration of the for-cycle I'm assigning the three elements
    % of y and u in reversed order to the vectors Vy and Vu, so that these 
    % can be linked to form the proper column-vector phi at each t;
    
    phi = -flipud(y((t-n):(t-1)));  
%     Vu = flipud(u((t-n):(t-1)));  
%     phi = vertcat(-Vy,Vu);
    
    % The following computations are the four steps of the RLS_3 algorithm
    % presented in the slides; in this version of the RLS the algorithm 
    % takes advantage of the "matrix inversion lemma" in order not to
    % compute the inverse of S per each iteration of the cycle;
    
    S_inv = S_inv-((S_inv*(phi*phi')*S_inv)/(1+(phi'*S_inv*phi)));  % 1. 
    K = S_inv*phi;                                                  % 2.
    epsilon = y(t)-(phi'*theta);                                    % 3. 
    theta = theta+(K*epsilon);                                      % 4. 
    
end

end