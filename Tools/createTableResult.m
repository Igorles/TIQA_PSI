function result = createTableResult(resultTmp,names)

result = {'IQA Methods','Spearman','Kendall','Pearson','RMSE'};
for j=2:(size(resultTmp,2)+1)
    tmp = median(resultTmp{j-1});
    result{j,1}= names{j-1};
    result{j,2} = tmp(1);
    result{j,3} = tmp(2);
    result{j,4} = tmp(3);
    result{j,5} = tmp(4);
end


fig = uifigure('Unit','normalized','Position',[0 0 0.7 0.9]);
g = uigridlayout(fig,[1 1]);

tmp = result(2:end,1);
tmp2 = result(1,2:end);
tableData = cell2table(result(2:end,2:end));

tableData.Properties.VariableNames = tmp2;
tableData.Properties.RowNames = tmp;

uit = uitable(g);

uit.Data = tableData;

disp(tableData)

end

