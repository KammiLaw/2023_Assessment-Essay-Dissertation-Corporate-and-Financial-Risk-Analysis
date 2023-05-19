% 3 assets portfolio
close all; clear all 

STAN = importdata('STAN.L.csv'); % import Standard Chartered PLC data 
STAN_ACP=STAN.data(:,5); % Extracts column 6 (Adjusted Close Price) 

NWG = importdata('NWG.L.csv'); % import Natwest Group plc data 
NWG_ACP=NWG.data(:,5); % Extracts column 6 (Adjusted Close Price) 

MTRO = importdata('MTRO.L.csv'); % import Metro Bank PLC data 
MTRO_ACP=MTRO.data(:,5); % Extracts column 6 (Adjusted Close Price) 


n=3; %number of assets

V=[STAN_ACP,NWG_ACP,MTRO_ACP];

LinR=zeros(length(STAN_ACP)-1,n);

for i=1:length(STAN_ACP)-1
for j=1:n
LinR(i,j)=(V(i+1,j)-V(i,j))./V(i,j);
end
end


VaR = quantile(LinR, 0.05) 

threshold_returns = LinR(LinR < VaR);
ETL = mean(threshold_returns)

