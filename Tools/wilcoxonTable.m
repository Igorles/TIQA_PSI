function wilcoxonTable(resultTmp,names)
map = [ 
    0.98431372549, 0.41568627451, 0.42352941176 %red
    0.99607843137, 0.90980392157, 0.57647058824 %yellow
    0.38039215686, 0.74117647059, 0.51764705882 %green
    ];

figure
wybor_korelacji = 1;
for i=1:size(resultTmp,2)
    for ii=1:size(resultTmp,2)
        test  = resultTmp{i}(:,wybor_korelacji);
        test2 = resultTmp{ii}(:,wybor_korelacji);
        [p,h] = ranksum(test(:,1),test2(:,1));
        if h == 1
            if median(test(:,1)) > median(test2(:,1))
                h = 1;
            else
                h = -1;
            end
        end
        score_array(i,ii) = double(h);
        score_array2(i,ii) = double(p);
    end
end

h = heatmap(names,names,score_array,'Colormap',map);
h.ColorbarVisible = 'off';
title('Spearman Correlation')


figure
wybor_korelacji = 2;
for i=1:size(resultTmp,2)
    for ii=1:size(resultTmp,2)
        test  = resultTmp{i}(:,wybor_korelacji);
        test2 = resultTmp{ii}(:,wybor_korelacji);
        [p,h] = ranksum(test(:,1),test2(:,1));
        if h == 1
            if median(test(:,1)) > median(test2(:,1))
                h = 1;
            else
                h = -1;

            end
        end
        score_array(i,ii) = double(h);
        score_array2(i,ii) = double(p);
    end
end

h = heatmap(names,names,score_array,'Colormap',map);
h.ColorbarVisible = 'off';
title('Kendall Correlation')



figure
wybor_korelacji = 3;
for i=1:size(resultTmp,2)
    for ii=1:size(resultTmp,2)
        test  = resultTmp{i}(:,wybor_korelacji);
        test2 = resultTmp{ii}(:,wybor_korelacji);
        [p,h] = ranksum(test(:,1),test2(:,1));
        if h == 1
            if median(test(:,1)) > median(test2(:,1))
                h = 1;
            else
                h = -1;
            end
        end
        score_array(i,ii) = double(h);
        score_array2(i,ii) = double(p);
    end
end


h = heatmap(names,names,score_array,'Colormap',map);
h.ColorbarVisible = 'off';
title('Pearson Correlation')
end

