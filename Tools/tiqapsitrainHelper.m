ref_ind=[];
image_no=168; 
for i=1:image_no
    ref_ind=[ref_ind;i];
end

N = 10; % number of subsets
percentage=0.8;
Ref_number = max(ref_ind);
REF = round(Ref_number*percentage);
C = zeros(N,REF);
for j = 1:N
    rand_order = randperm(Ref_number);
    C(j,:) = rand_order(1:REF);
end

PC_img = strcat(pwd,filesep,'Database',filesep,'SS',filesep,PC_img);
TC_img = strcat(pwd,filesep,'Database',filesep,'SS',filesep,TC_img);
TC_img_ref = strcat(pwd,filesep,'Database',filesep,'SS',filesep,TC_img_ref);
PC_img_ref = strcat(pwd,filesep,'Database',filesep,'SS',filesep,PC_img_ref);

for i=1:N
    disp(i)
    train = ismember(ref_ind,C(i,:));
    test = ~train;
    PC_img_train = PC_img(train,:);
    TC_img_train = TC_img(train,:);
    DMOS_PC_TC2 = DMOS_PC_TC(train,:);
    Create_Svr_Models(PC_img_train,TC_img_train,DMOS_PC_TC2,i,IQA)
    images = TC_img(test,:);
    imagesRef = TC_img_ref(test,:);
    images2 = PC_img(test,:);
    imagesRef2 = PC_img_ref(test,:);
    score = iqa_metrics(images,imagesRef,images2,imagesRef2,IQA,i);
    DMOS_PC_TC_test = DMOS_PC_TC(test,:);
    names = fieldnames(score);

    for j=1:size(IQA,2)
        a = cell2mat(score.(names{j}));
        if size(a,1) == 1
            a = a';
        end
        resultTmp{j}(i,:) = abs(metric_evaluation(a,DMOS_PC_TC_test));
    end

end