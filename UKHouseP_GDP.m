% UK House Prices
yearHousePrices = [1990:2019];
housePrices = [58065.4516, 57284.71519, 54801.00386, 54216.31341, 55626.64272, 56033.46849, 58329.77391, 63546.18425, 70869.048, 78937.75897, 90306.27892, 97266.27668, 114787.4261, 131175.9951, 146746.8218, 157014.3547, 169911.9673, 185948.3664, 174473.7114, 162000.9498, 170350.452, 167772.3409, 168706.4058, 173761.8943, 187810.1095, 199123.3694, 212539.6007, 222177.8015, 228668.4158, 230914.2005];

% UK GDP Per Capita
yearGDP = [1990:2019];
GDPPerCapita = [19095, 19901, 20487, 18389, 19709, 23202, 24440, 26781, 28298, 28787, 28291, 27887, 30080, 34479, 40391, 42132, 44537, 50435, 47430, 38821, 39693, 42151, 42486, 43449, 47448, 45071, 41146, 40621, 43306, 42747];

% Perform regression analysis
mdl = fitlm(GDPPerCapita', housePrices');

% Calculate the correlation coefficient
corrCoeff = corr(GDPPerCapita', housePrices');

% Plot the data and regression line
figure(3);
scatter(GDPPerCapita, housePrices,'filled');
hold on;
plot(mdl);
xlabel('GDP Per Capita (US $)');
ylabel('UK House Prices');
title('Correlation between UK House Prices and GDP Per Capita');
legend('Data Points', 'x','Regression Line');
grid on;

% Display the correlation coefficient
disp(['Correlation Coefficient: ', num2str(corrCoeff)]);


