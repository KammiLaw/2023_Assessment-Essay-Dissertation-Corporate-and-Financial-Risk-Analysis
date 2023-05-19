
close all; clear all; 
returns_assets = readmatrix('20AssetsLinR.csv', 'Range', 'X4:AQ253');  
returns_etf = readmatrix('RSP_ETF.csv', 'Range', 'J3:J252'); 
% Define the sub-time intervals (monthly, 21 trading days)
sub_intervals = 21:21:size(returns_assets, 1);

%Initialize arrays to store portfolio and ETF returns for each sub-time interval
portfolio_returns = zeros(length(sub_intervals), 1);
etf_returns = zeros(length(sub_intervals), 1);


optimized_weights = [
    2.88876006518544e-05;
    2.56492611454974e-05;
    1.89904481374124e-05;
    2.13946435777461e-05;
    1.67643787038657e-05;
    0.000144064279430155;
    4.32141850434811e-05;
    0.0769000796309704;
    0.0769000796311779;
    0.0769000796309891;
    0.0769000796310486;
    0.0769000796307275;
    0.0769000796305896;
    0.0769000796309072;
    0.0769000796308842;
    0.0769000796309949;
    0.0769000796317792;
    0.0769000796310897;
    0.0769000796318515;
    0.0769000796303001
];


for i = 1:length(sub_intervals)
    start_index = sub_intervals(i) - 20;
    end_index = sub_intervals(i);


    % Extract the returns for the sub-time interval for the portfolio and ETF
    portfolio_returns_interval = returns_assets(start_index:end_index, :);
    etf_returns_interval = returns_etf(start_index:end_index);
    
    % Calculate the weighted portfolio returns using the optimized weights
    weighted_portfolio_returns = portfolio_returns_interval * optimized_weights;
    
    % Calculate the equal-weighted ETF return for the sub-time interval
    equal_weighted_etf_return = mean(etf_returns_interval);
    
    % Store the portfolio and ETF returns for the sub-time interval
    portfolio_returns(i) = mean(weighted_portfolio_returns);
    etf_returns(i) = equal_weighted_etf_return;
end

% 
x_labels = datetime(year(datetime('now')), 5, 1) - calmonths(length(sub_intervals)-1:-1:0);
x_labels = cellstr(datestr(x_labels, 'mm/yyyy')); % Convert to cell array of character vectors

%  the performance comparison
figure;
plot(sub_intervals, portfolio_returns, 'g', 'LineWidth', 2);
hold on;
plot(sub_intervals, etf_returns, 'r', 'LineWidth', 2);
hold off;
xlabel('Sub-Time Intervals');
xticks(sub_intervals);
xticklabels(x_labels);
ylabel('Returns');
title('Performance Comparison: Portfolio vs. Equal-Weighted ETF (RSP)');
legend('Portfolio', 'Equal-Weighted ETF');
grid on;
