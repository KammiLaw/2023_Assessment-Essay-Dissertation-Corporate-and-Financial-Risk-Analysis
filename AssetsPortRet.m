
function Ret = AssetsPortRet(x)

Return = readmatrix('20AssetsLinR.csv', 'Range', 'X4:AQ253'); % input returns for 20 assets

Ret = x(1)* Return(:,1) + x(2)*Return(:,2) + x(3)*Return(:,3)+ x(4)*Return(:,4)+ x(5)*Return(:,5) + x(6)*Return(:,6)+ x(7)*Return(:,7),+ x(8)*Return(:,8)+ x(9)*Return(:,9)+ x(10)*Return(:,10)+ x(11)*Return(:,11)+ x(12)*Return(:,12)+ x(13)*Return(:,13)+ x(14)*Return(:,14)+ x(15)*Return(:,15)+ x(16)*Return(:,16)+ x(17)*Return(:,17)+ x(18)*Return(:,18)+ x(19)*Return(:,19)+ x(20)*Return(:,20);

end

