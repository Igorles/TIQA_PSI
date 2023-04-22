function createBoxPlot(resultTmp,result)

for i=1:size(resultTmp,2)
    tmp(:,i) = resultTmp{i}(:,1);
end

figure
boxplot(tmp,result(2:end,1),'Notch','on')
title('Spearman Correlation')

clear tmp
for i=1:size(resultTmp,2)
    tmp(:,i) = resultTmp{i}(:,2);
end

figure
boxplot(tmp,result(2:end,1),'Notch','on')
title('Kendall Correlation')

clear tmp
for i=1:size(resultTmp,2)
    tmp(:,i) = resultTmp{i}(:,3);
end

figure
boxplot(tmp,result(2:end,1),'Notch','on')
title('Pearson Correlation')
end

