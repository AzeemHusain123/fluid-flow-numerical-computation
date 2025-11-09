% Parameters and initial values
Q = 15;          % Updated constant value for Q
K = 2.5;           % Updated constant value for K
Ps = 100;        % Given Ps value
P0 = 90;         % Initial guess
epsilon = 1e-6;  % Convergence tolerance
max_iter = 100;  % Maximum iterations to prevent infinite loop

% Initialize variables
Pn = P0;         % Current value of P
error = inf;     % Initialize error
iter = 0;        % Iteration counter

% Iterative process
fprintf('Iteration\tP(n)\t\tError\n');
while error > epsilon && iter < max_iter
    iter = iter + 1;
    
    % Check for valid square root operation
    if Ps - Pn <= 0
        fprintf('Iteration stopped: Ps - Pn <= 0\n');
        break;
    end
    
    % Calculate P(n+1) using the given formula
    P_next = Pn + (2 * (Q - K * sqrt(Ps - Pn)) * sqrt(Ps - Pn)) / K;
    
    % Calculate error
    error = abs(P_next - Pn);
    
    % Display current iteration values
    fprintf('%d\t\t%.6f\t%.6e\n', iter, P_next, error);
    
    % Update Pn for the next iteration
    Pn = P_next;
end

% Display final result
if error <= epsilon
    fprintf('Converged to P = %.6f after %d iterations.\n', Pn, iter);
else
    fprintf('Did not converge within the maximum number of iterations.\n');
end
