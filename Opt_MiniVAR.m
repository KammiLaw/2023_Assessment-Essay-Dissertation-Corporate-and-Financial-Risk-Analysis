clear all; close all;

returns = readmatrix('20AssetsLinR.csv', 'Range', 'X4:AQ253'); % Modify the file name and path accordingly

% Define the objective function (VaR function)
fun = @(x) -GetVar(AssetsPortRet(x), 0.05, -1); % Negative sign for maximizing the return

% Define the constraints
A = -eye(20); % Constraint matrix for negative weights
b = zeros(20, 1); % constraint vector for negative weights
Aeq = ones(1, 20); % Constraint matrix for sum of weights = 1
beq = 1; % Constraint vector for sum of weights = 1
lb = zeros(20, 1); % Lower bounds for weights
ub = ones(20, 1); % Upper bounds for weights

%the optimization
x0 = ones(20, 1) / 20; % Initial guess for equal weights
options = optimoptions('fmincon', 'Display', 'iter'); % Optional: Display optimization progress
[x, fval] = fmincon(fun, x0, A, b, Aeq, beq, lb, ub, [], options);

% the optimized weights and the corresponding VaR
disp('Optimized Weights:');
disp(x);
VaR = -fval;
disp(['Minimum VaR: ', num2str(VaR)]);
