function Create_Svr_Models(PC_img,TC_img,DMOS_PC_TC,Flag,IQA)
warning off;
addpath(genpath('Tools'));
addpath(genpath('IQA_Methods'));

IQA2 = {'BRISQUE','FRIQUEE','BLINDER',...
    'GWH-GLBP-BIQA','MLPSIE','NOREQI',...
    'SINDEX','SSEQ'};

wynik = ismember(IQA2,IQA);
IQA = IQA2(wynik);
val=0;

%% BRISQUE
if ismember('BRISQUE',IQA)

    val=val+1;
    disp(strcat(num2str(val),'/',num2str(sum(wynik)),' Create Svr model for BRISQUE'))

    if ~exist(fullfile('IQA_Methods',filesep,'BRISQUE',filesep',strcat('model_',num2str(Flag),'.mat')), 'file')

        for j=1:length(DMOS_PC_TC)

            featTmpPC = brisque_feature(imread(PC_img{j}));
            featTmpTC = brisque_feature(imread(TC_img{j}));
            feat(j,:) = [featTmpTC featTmpPC];

        end
        % feat(isnan(feat))=0;
        model_Brisque = svmtrain(DMOS_PC_TC, feat, '-s 3 -g 0.2 -c 1000 -q');
        save(strcat(pwd,filesep,'IQA_Methods',filesep,'BRISQUE',filesep',strcat('model_',num2str(Flag),'.mat')),'model_Brisque')

    end
    clear feat
end
%% FRIQUEE
if ismember('FRIQUEE',IQA)

    val=val+1;
    disp(strcat(num2str(val),'/',num2str(sum(wynik)),' Create Svr model for FRIQUEE'))

    if ~exist(fullfile('IQA_Methods',filesep,'FRIQUEE',filesep',strcat('model_',num2str(Flag),'.mat')), 'file')

        for j=1:length(DMOS_PC_TC)


            featTmpPC = extractFRIQUEEFeatures(imread(PC_img{j}));
            featTmpTC = extractFRIQUEEFeatures(imread(TC_img{j}));

            feat(j,:) = [featTmpTC.friqueeALL featTmpPC.friqueeALL];

        end
        % feat(isnan(feat))=0;
        model_FRIQUEE = svmtrain(DMOS_PC_TC, feat, '-s 3 -g 0.0001 -c 50 -q');
        save(strcat(pwd,filesep,'IQA_Methods',filesep,'FRIQUEE',filesep',strcat('model_',num2str(Flag),'.mat')),'model_FRIQUEE')

    end
    clear feat
end

%% BLINDER
if ismember('BLINDER',IQA)

    val=val+1;
    disp(strcat(num2str(val),'/',num2str(sum(wynik)),' Create Svr model for BLINDER'))

    if ~exist(fullfile('IQA_Methods',filesep,'BLINDER',filesep',strcat('model_',num2str(Flag),'.mat')), 'file')

        [model_Blinder,Constants] = createModelsBlinder(TC_img,PC_img,DMOS_PC_TC);
        save(strcat(pwd,filesep,'IQA_Methods',filesep,'BLINDER',filesep',strcat('model_',num2str(Flag),'.mat')),'model_Blinder','Constants')

    end
    clear feat
end

%% GWH-GLBP-BIQA
if ismember('GWH-GLBP-BIQA',IQA)

    val=val+1;
    disp(strcat(num2str(val),'/',num2str(sum(wynik)),' Create Svr model for GWH-GLBP-BIQA'))

    if ~exist(fullfile('IQA_Methods',filesep,'GWH-GLBP-BIQA',filesep',strcat('model_',num2str(Flag),'.mat')), 'file')

        for j=1:length(DMOS_PC_TC)

            featTmpPC = gwhglbp_feature(double(rgb2gray(imread(PC_img{j}))));
            featTmpTC = gwhglbp_feature(double(rgb2gray(imread(TC_img{j}))));
            feat(j,:) = [featTmpTC featTmpPC];

        end
        % feat(isnan(feat))=0;
        model_gwhglbp = svmtrain(DMOS_PC_TC, feat, '-s 3 -g 2 -c 100  -q ');
        save(strcat(pwd,filesep,'IQA_Methods',filesep,'GWH-GLBP-BIQA',filesep',strcat('model_',num2str(Flag),'.mat')),'model_gwhglbp')

    end
    clear feat
end
%% MLPSIE
if ismember('MLPSIE',IQA)

    val=val+1;
    disp(strcat(num2str(val),'/',num2str(sum(wynik)),' Create Svr model for MLPSIE'))

    if ~exist(fullfile('IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')), 'file')

        [data] = create_features(TC_img,PC_img,DMOS_PC_TC);
        save_h5_mlpsie(data,Flag)

    end
    clear feat
end
%% NOREQI
if ismember('NOREQI',IQA)

    val=val+1;
    disp(strcat(num2str(val),'/',num2str(sum(wynik)),' Create Svr model for NOREQI'))

    if ~exist(fullfile('IQA_Methods',filesep,'NOREQI',filesep',strcat('model_',num2str(Flag),'.mat')), 'file')

        for j=1:length(DMOS_PC_TC)

            featTmpPC=NOREQI(rgb2gray(imread(PC_img{j})));
            featTmpTC=NOREQI(rgb2gray(imread(TC_img{j})));
            feat(j,:) = [featTmpTC featTmpPC];

        end

        minyO=min(feat);  %1) Different features have different ranges. Find them.
        maxyO=max(feat);
        feat=double(normVec(feat,maxyO,minyO));
        model_NOREQI = svmtrain(DMOS_PC_TC, feat, '-s 3 -g 0.02083 -c 50 -p 0 -q');
        save(strcat(pwd,filesep,'IQA_Methods',filesep,'NOREQI',filesep',strcat('model_',num2str(Flag),'.mat')),'model_NOREQI','maxyO','minyO')

    end
    clear feat
end
% % % % % % % % % % % % % % % % %% SINDEX
% % % % % % % % % % % % % % % % if ismember('SINDEX',IQA)
% % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % %     val=val+1;
% % % % % % % % % % % % % % % %     disp(strcat(num2str(val),'/',num2str(sum(wynik)),' Create Svr model for SINDEX'))
% % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % %     if ~exist(fullfile('IQA_Methods',filesep,'SINDEX',filesep',strcat('model_',num2str(Flag),'.mat')), 'file')
% % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % %         for j=1:length(DMOS_PC_TC)
% % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % %             featTmpPC=s_index(imread(PC_img{j}));
% % % % % % % % % % % % % % % %             featTmpTC=s_index(imread(TC_img{j}));
% % % % % % % % % % % % % % % %             feat(j,:) = [featTmpTC featTmpPC];
% % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % %         end
% % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % %         minyO=min(feat);  %1) Different features have different ranges. Find them.
% % % % % % % % % % % % % % % %         maxyO=max(feat);
% % % % % % % % % % % % % % % %         feat=double(normVec(feat,maxyO,minyO));
% % % % % % % % % % % % % % % %         model_SINDEX = svmtrain(DMOS_PC_TC, feat, '-s 3 -q');
% % % % % % % % % % % % % % % %         save(strcat(pwd,filesep,'IQA_Methods',filesep,'SINDEX',filesep',strcat('model_',num2str(Flag),'.mat')),'model_SINDEX','minyO','maxyO')
% % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % %     end
% % % % % % % % % % % % % % % %     clear feat
% % % % % % % % % % % % % % % % end
%% SSEQ
if ismember('SSEQ',IQA)

    val=val+1;
    disp(strcat(num2str(val),'/',num2str(sum(wynik)),' Create Svr model for SSEQ'))

    if ~exist(fullfile('IQA_Methods',filesep,'SSEQ',filesep',strcat('model_',num2str(Flag),'.mat')), 'file')

        for j=1:length(DMOS_PC_TC)

            featTmpPC=feature_extract_SEEQ(imread(PC_img{j}),3);
            featTmpTC=feature_extract_SEEQ(imread(TC_img{j}),3);
            feat(j,:) = [featTmpTC featTmpPC];

        end

        minyO=min(feat);  %1) Different features have different ranges. Find them.
        maxyO=max(feat);
        feat=double(normVec(feat,maxyO,minyO));
        model_SSEQ = svmtrain(DMOS_PC_TC, feat, '-s 3 -q');
        save(strcat(pwd,filesep,'IQA_Methods',filesep,'SSEQ',filesep',strcat('model_',num2str(Flag),'.mat')),'model_SSEQ','minyO','maxyO')

    end
    clear feat
end
disp('Done create svr models')
disp('-------------------------------------------')
end
