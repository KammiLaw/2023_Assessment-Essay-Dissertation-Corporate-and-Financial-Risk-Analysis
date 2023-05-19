% UK mean average house price data
years = [1990:2019];
housePrices = [58065.4516, 57284.71519, 54801.00386, 54216.31341, 55626.64272, ...
    56033.46849, 58329.77391, 63546.18425, 70869.048, 78937.75897, ...
    90306.27892, 97266.27668, 114787.4261, 131175.9951, 146746.8218, ...
    157014.3547, 169911.9673, 185948.3664, 174473.7114, 162000.9498, ...
    170350.452, 167772.3409, 168706.4058, 173761.8943, 187810.1095, ...
    199123.3694, 212539.6007, 222177.8015, 228668.4158, 230914.2005];

figure(2)
% Plotting the line graph
plot(years, housePrices, 'r-o', 'LineWidth', 2);
xlabel('Year');
ylabel('Mean Average House Price');
title('Trend of UK Mean Average House Price');

% Formatting the plot
grid on;
legend('Mean Average House Price');
