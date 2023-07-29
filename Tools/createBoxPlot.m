function createBoxPlot(resultTmp,result)

for i=1:size(resultTmp,2)
    tmp(:,i) = resultTmp{i}(:,1);
end

fig = figure;
axes1 = axes('Parent',fig);
boxplot(tmp,result(2:end,1),'Notch','on')
set(axes1,'FontWeight','bold','FontSize',12)
title('Spearman Correlation')

clear tmp
for i=1:size(resultTmp,2)
    tmp(:,i) = resultTmp{i}(:,2);
end

fig2 = figure;
axes2 = axes('Parent',fig2);
boxplot(tmp,result(2:end,1),'Notch','on')
set(axes2,'FontWeight','bold','FontSize',12)
title('Kendall Correlation')

clear tmp
for i=1:size(resultTmp,2)
    tmp(:,i) = resultTmp{i}(:,3);
end

fig3 = figure;
axes3 = axes('Parent',fig3);
boxplot(tmp,result(2:end,1),'Notch','on')
set(axes3,'FontWeight','bold','FontSize',12)
title('Pearson Correlation')
end

