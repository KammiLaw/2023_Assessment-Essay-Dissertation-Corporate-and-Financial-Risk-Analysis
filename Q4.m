% Step 1: Define parameters and assumptions

close all; clear all; 

%Assuming the retail business has the following datas
numSimulations = 100000;  % Number of simulations
salesMean = 50000;     % Mean of sales volume
salesStd = 10000;      % Standard deviation of sales volume
costMean = 0.6;        % Mean of cost of goods sold
costStd = 0.1;         % Standard deviation of cost of goods sold
expensesMean = 20000;  % Mean of operating expenses
expensesStd = 5000;    % Standard deviation of operating expenses

% Step 2: Generate random samples
sales = normrnd(salesMean, salesStd, numSimulations, 1);
cost = lognrnd(log(costMean^2 / sqrt(costMean^2 + costStd^2)), sqrt(log(1 + (costStd^2 / costMean^2))), numSimulations, 1);
expenses = normrnd(expensesMean, expensesStd, numSimulations, 1);

% Step 3: Calculate profit
profit = sales .* (1 - cost) - expenses;

% Step 4: Analyze the profit distribution

% Plot histogram
numBins = 50;
figure;
histogram(profit, numBins, 'Normalization', 'probability');
title('Profit Distribution (Histogram)');
xlabel('Profit');
ylabel('Probability');

% Fit normal distribution
pd = fitdist(profit, 'Normal');
x = linspace(min(profit), max(profit), 100);
y = pdf(pd, x);

% Plot normal distribution
figure;
plot(x, y, 'LineWidth', 1.5, 'Color', 'r', 'LineStyle', '--');
title('Profit Distribution (Normal Distribution)');
xlabel('Profit');
ylabel('Probability Density');
