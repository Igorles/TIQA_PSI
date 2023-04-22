function tableData = prepareScoreResult(scoreBefore,algorithms)

namesIqa = fieldnames(scoreBefore);

for i=1:size(namesIqa,1)

    tym_name = namesIqa{i};

    switch tym_name

        case 'BRISQUE'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'ascend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;
        case 'FRIQUEE'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'ascend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'BLINDER'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'ascend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'GWH_GLBP_BIQA'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'ascend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'MLPSIE'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'ascend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'NOREQI'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'ascend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'SINDEX'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'descend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'SSEQ'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'ascend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'SINQ'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'descend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'DIVINE'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'ascend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'NIQE'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'descend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'SR_metric'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'ascend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'CEIQ'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'ascend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'UNIQUE'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'descend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'DISTS'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'ascend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'VIF'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'descend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'SSIM'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'descend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'MULTISSIM'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'descend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'MDSI'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'ascend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'HaarPSI'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'descend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'SVD'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'ascend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'ERGAS'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'ascend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'SAM'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'ascend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'Q2n'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'descend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'Q'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'descend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'SCC'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'descend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'IFC'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'descend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'MSUNIQUE'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'descend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'ReSIFT'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'descend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'SUMMER'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'descend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        case 'PerSIM'

            tempScore = abs(cell2mat(scoreBefore.(namesIqa{i})));
            score.(namesIqa{i}) = tempScore;
            [a1 a2] = sort(tempScore,'descend');
            rank = 1:length(tempScore);
            rank(a2) = rank;
            score2.(namesIqa{i}) = rank;

        otherwise
            text = strcat('Unexpected IQA methods: ',(namesIqa{i}));
            disp(text)
    end

end

for i =1:size(namesIqa,1)
    if isnan(score.(namesIqa{i})) ~= 0
        score = rmfield(score,(namesIqa{i}));
    end
end

namesIqa = fieldnames(score);
P=[];

for i=1:size(namesIqa,1)
    tym =score.(namesIqa{i})';
    P = [P; tym'];
end

P = round(P, 4);

% if ~isempty(algorithms)

fig = uifigure('Unit','normalized','Position',[0 0 0.7 0.9]);
g = uigridlayout(fig,[2 1]);

if ~isempty(algorithms)
    tableData = array2table(P,'VariableNames',algorithms,'RowNames',namesIqa);
else
    tym = size(P,2);
    for i=1:tym
        algorithms{i} = strcat('Image ',num2str(i));
    end

    tableData = array2table(P,'VariableNames',algorithms,'RowNames',namesIqa);
end
uit = uitable(g);
uit.Data = tableData;

disp(tableData)

P=[];
for i=1:size(namesIqa,1)
    tym =score2.(namesIqa{i})';
    P = [P; tym'];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
namesIqa = cat(1,{namesIqa{:},'Ranking'});
temp = sum(P);
[a1 a2] = sort(temp,'ascend');
algorithms = algorithms(a2);
P = [P; temp];
P = P(:,a2);
[a1 a2] = sort(P(end,:),'ascend');
P(end,:) = a2;

a=[];
for i=1:size(P,2)
a = [a,ismember(P(1:end-1,i),P(end,i))];
end
s = uistyle("BackgroundColor","#77AC30");
[row,col] = find(a == 1);

tableData = array2table(P,'VariableNames',algorithms,'RowNames',namesIqa);

uit2 = uitable(g);
uit2.Data = tableData;

addStyle(uit2,s,"cell",[row,col])


disp(tableData)
