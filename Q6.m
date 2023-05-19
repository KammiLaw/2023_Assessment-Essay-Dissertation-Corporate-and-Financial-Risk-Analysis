close all; clear all;

data = readtable('TSLA.csv'); % Tesla 

% Extract the 'Date' and 'Adj Close' columns
date = data.Date;
adjClose = data.AdjClose; 

% Plot the price performance using MATLAB's plot function
plot(date, adjClose);
title('Tesla Stock Price Performance');
xlabel('Date');
ylabel('Adjusted Close Price');
grid on;

% Calculate the cumulative return
cumulativeReturn = cumsum(adjClose) / adjClose(1);

% Calculate the Sharpe ratio
returns = diff(adjClose) ./ adjClose(1:end-1);
riskFreeRate = 0.02; % Assuming a risk-free rate of 2%
sharpeRatio = (mean(returns) - riskFreeRate) / std(returns);

% Display the cumulative return and Sharpe ratio
fprintf('Cumulative Return: %.2f\n', cumulativeReturn(end));
fprintf('Sharpe Ratio: %.2f\n', sharpeRatio);
