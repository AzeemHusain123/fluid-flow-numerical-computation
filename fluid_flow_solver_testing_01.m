Q=-15;
K=2.5;
S=100;

% Define the function and its derivative
f = @(P) K * sqrt(S - P)-Q;             % Function f(P)
df = @(P) K / (2 * sqrt(S - P));          % Derivative f'(P)

% Initial guess
P0 = 90;

% Tolerance level
tol = 1e-6;

% Maximum number of iterations
max_iter = 100;

% Array to store the estimates of the root at each iteration
root_estimates = [];

% Newton-Raphson Method loop
for i = 1:max_iter
    % Calculate the next estimate using Newton-Raphson formula
    P1 = P0 - f(P0) / df(P0);
    
    % Store the current estimate for plotting
    root_estimates = [root_estimates, P1];
    
    % Check for convergence (if the change is smaller than the tolerance)
    if abs(P1 - P0) < tol
        fprintf('Root found: %.6f after %d iterations\n', P1, i);
        break;
    end
    
    % Update the current estimate for the next iteration
    P0 = P1;
    
    % If loop finishes without convergence
    if i == max_iter
        fprintf('Did not converge after %d iterations\n', max_iter);
    end
end

% Plot the root estimates over iterations
figure;
plot(1:length(root_estimates), root_estimates, '-o', 'LineWidth', 2, 'MarkerSize', 6);
xlabel('Iteration Number');
ylabel('Root Estimate');
title('Newton-Raphson: Root Estimate vs Iteration');
grid on;