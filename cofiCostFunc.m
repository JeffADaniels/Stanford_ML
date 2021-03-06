function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the X and Theta matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.

% assignment
% collaborative filtering cost
% collaborative filtering gradient
% regularized cost
% gradient with regularization



% vectorized implementaiton to compute J
%  sum(sum(R.*M) is the sum of all the elements of M for which the corresponding in R equals 1
% J = 


residuals = R .* (Theta*X'- Y')';

J = 1/2*sum(sum(residuals.^2));

X_grad =  residuals * Theta + lambda*X; 

Theta_grad = residuals' * X + lambda*Theta;


theta_reg = lambda/2*sum(sum(Theta.^2));

x_reg = lambda/2*sum(sum(X.^2));

J = J + theta_reg + x_reg;



% implement the gradient with a for-loop over movies
% implement the gradient with a for-loop over users 
% how do you vectorize for the inner loops?
% index Theta
% index Y
% idx = find(R(i, :) == 1) is list of all the users that have rated movie i
% create Theta_temp = Theta(idx, ;) 

%% add regularization to original computations 
%% check implementation of gradients


%%% 





%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%
















% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
