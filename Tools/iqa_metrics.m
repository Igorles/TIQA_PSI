function score = iqa_metrics(images,imagesRef,images2,imagesRef2,IQA,Flag)

if size(images,4)>1
    x = size(images,4);
else
    [x y]=size(images);
    if y > x
        x = y;
    end
end
tmp=1;

disp('-----------Begins rating image/s-----------')


    val = size(IQA,2);


if (isempty(images2) && isempty(imagesRef2))

    for i=1:x
        temp = 0;
        if size(images,4)>1
            img = images(:,:,:,i);
        else
            img = imread(images{i});
        end

        %% BRISQUE
        if ismember('BRISQUE',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method BRISQUE Rates the image'," ",num2str(i),'/',num2str(x)))

            load(strcat(pwd,filesep,'IQA_Methods',filesep,'BRISQUE',filesep',strcat('model_',num2str(Flag),'.mat')))
            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'BRISQUE'))
            feat = brisque_feature(img);
            feat(isnan(feat))=0;
            [score.BRISQUE{i}, ~, ~] = svmpredict(1,feat, model_Brisque ,' -q');
            cd ../..
        end
        %% FRIQUEE
        if ismember('FRIQUEE',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method FRIQUEE Rates the image'," ",num2str(i),'/',num2str(x)))

            load(strcat(pwd,filesep,'IQA_Methods',filesep,'FRIQUEE',filesep',strcat('model_',num2str(Flag),'.mat')))
            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'FRIQUEE'))
            feat = extractFRIQUEEFeatures(img);
            feat = feat.friqueeALL;
            feat(isnan(feat))=0;
            [score.FRIQUEE{i}, ~, ~] = svmpredict(1,feat, model_FRIQUEE ,' -q');
            cd ../..
        end
        %% BLINDER
        if ismember('BLINDER',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method BLINDER Rates the image'," ",num2str(i),'/',num2str(x)))

            if ~exist('model_Blinder','var')
                load(strcat(pwd,filesep,'IQA_Methods',filesep,'BLINDER',filesep',strcat('model_',num2str(Flag),'.mat')))
            end
            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'BLINDER'))
            score.BLINDER{i}= scoreBlinder(img,[],model_Blinder,vgg16);
            cd ../..
        end
        %% GWH-GLBP-BIQA
        if ismember('GWH-GLBP-BIQA',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method GWH-GLBP-BIQA Rates the image'," ",num2str(i),'/',num2str(x)))

            load(strcat(pwd,filesep,'IQA_Methods',filesep,'GWH-GLBP-BIQA',filesep',strcat('model_',num2str(Flag),'.mat')))
            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'GWH-GLBP-BIQA'))
            feat = gwhglbp_feature(double(rgb2gray(img)));
            feat(isnan(feat))=0;
            [score.GWH_GLBP_BIQA{i}, ~, ~] = svmpredict(1,feat, model_gwhglbp ,' -q');
            cd ../..
        end
        %% MLPSIE
        if ismember('MLPSIE',IQA)
            temp = temp+1;
            
            if tmp ==1
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method MLPSIE Rates the all image/s'))
                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE'))
                if ~exist('data','var')
                    data = load_h5_mlpsie(Flag);
                end
                tmp = tmp-1;
                tym_mlpsie = MLPSIE2(images,data);
                temp2 = tym_mlpsie';
                for q_tmp = 1: size(temp2,2)
                    score.MLPSIE{q_tmp} = temp2(q_tmp);
                end
                cd ../..
            end
        end
        %% NOREQI
        if ismember('NOREQI',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method NOREQI Rates the image'," ",num2str(i),'/',num2str(x)))

            load(strcat(pwd,filesep,'IQA_Methods',filesep,'NOREQI',filesep',strcat('model_',num2str(Flag),'.mat')))
            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'NOREQI'))
            feat = NOREQI(rgb2gray(img));
            feat = double(normVec(feat,maxyO,minyO));
            feat(isnan(feat))=0;
            [score.NOREQI{i}, ~, ~] = svmpredict(1,feat, model_NOREQI ,' -q');
            cd ../..
        end
        %% SSEQ
        if ismember('SSEQ',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method SSEQ Rates the image'," ",num2str(i),'/',num2str(x)))

            load(strcat(pwd,filesep,'IQA_Methods',filesep,'SSEQ',filesep',strcat('model_',num2str(Flag),'.mat')))
            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'SSEQ'))
            feat=feature_extract_SEEQ(img,3);
            feat=double(normVec(feat,maxyO,minyO));
            feat(isnan(feat))=0;
            [score.SSEQ{i}, ~, ~] = svmpredict(1,feat, model_SSEQ ,' -q');
            cd ../..
        end
        %% DIVINE
        if ismember('DIVINE',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method DIVINE Rates the image'," ",num2str(i),'/',num2str(x)))

            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'DIVINE'))
            score.DIVINE{i} = divine(rgb2gray(img));%36.5116
            cd ../..
        end
        %% NIQE
        if ismember('NIQE',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method NIQE Rates the image'," ",num2str(i),'/',num2str(x)))

            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'NIQE'))
            load modelparameters.mat
            blocksizerow    = 96;
            blocksizecol    = 96;
            blockrowoverlap = 0;
            blockcoloverlap = 0;
            score.NIQE{i} = computequalityNIQE((img),blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap, ...
                mu_prisparam,cov_prisparam);
            cd ../..
        end
        %% SR-metric
        if ismember('SR-metric',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method SR-metric Rates the image'," ",num2str(i),'/',num2str(x)))


            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'SR-metric'))
            score.SR_metric{i} = quality_predict_SR_metric(img);
            cd ../..
        end
        %% CEIQ
        if ismember('CEIQ',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method CEIQ Rates the image'," ",num2str(i),'/',num2str(x)))


            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'CEIQ'))
            score.CEIQ{i} = CEIQ(img);
            cd ../..
        end
        %% SINDEX
        if ismember('SINDEX',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method SINDEX Rates the image'," ",num2str(i),'/',num2str(x)))

            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'SINDEX'))
            feat=s_index(img);
            score.SINDEX{i} = feat;
            cd ../..
        end
        %%%%%%%%%%%%%%%%%%%% Full reference

        if ~isempty(imagesRef)

            if size(images,4)>1
                imgRef =  imagesRef(:,:,:,i);
            else
                imgRef = imread(imagesRef{i});
            end

            %% UNIQUE
            if ismember('UNIQUE',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method UNIQUE Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'UNIQUE'))
                score.UNIQUE{i} = mslUNIQUE(imgRef,img);
                cd ../..
            end
            %% DISTS
            if ismember('DISTS',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method DISTS Rates the image'," ",num2str(i),'/',num2str(x)))

                net_params = load('./IQA_Methods/DISTS/weights/net_param.mat');
                weights = load('./IQA_Methods/DISTS/weights/alpha_beta.mat');
                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'DISTS'))
                resize_img = 0;
                use_gpu = 0;
                score.DISTS{i} = DISTS(imgRef,img,net_params,weights, resize_img, use_gpu);
                cd ../..
            end
            %% VIF
            if ismember('VIF',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method VIF Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'VIF'))
                score.VIF{i} = vifvec(double(rgb2gray(imgRef)),double(rgb2gray(img)));
                cd ../..
            end
            %% SSIM
            if ismember('SSIM',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method SSIM Rates the image'," ",num2str(i),'/',num2str(x)))

                score.SSIM{i} =  ssim(imgRef,img);
            end
            %% MULTISSIM
            if ismember('MULTISSIM',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method MULTISSIM Rates the image'," ",num2str(i),'/',num2str(x)))

                score.MULTISSIM{i} =  mean(multissim(imgRef,img));
            end
            %% MDSI
            if ismember('MDSI',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method MDSI Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'MDSI'))
                score.MDSI{i} =  MDSI(imgRef,img);
                cd ../..
            end
            %% HaarPSI
            if ismember('HaarPSI',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method HaarPSI Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'HaarPSI'))
                score.HaarPSI{i} =  HaarPSI(imgRef,img);
                cd ../..
            end
            %% SVD
            if ismember('SVD',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method SVD Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'SVD'))
                blkSize = 8;
                [~ ,score.SVD{i}] = SVDQualityMeasure(imgRef,img,blkSize);
                cd ../..
            end
            %% ERGAS
            if ismember('ERGAS',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method ERGAS Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'ERGAS'))
                ratio = 4;
                score.ERGAS{i} = ERGAS(imgRef,img,ratio);
                cd ../..
            end
            %% SAM
            if ismember('SAM',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method SAM Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'SAM'))
                score.SAM{i} = SAM(double(imgRef),double(img));
                cd ../..
            end
            %% Q2n
            if ismember('Q2n',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method Q2n Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'Q2n'))
                Qblocks_size = 32;
                score.Q2n{i} = q2n(imgRef,img,Qblocks_size,Qblocks_size);
                cd ../..
            end
            %% Q
            if ismember('Q',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method Q Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'Q'))
                L = 11;
                score.Q{i} = Q(imgRef,img,2^L);
                cd ../..
            end
            %% SCC
            if ismember('SCC',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method SCC Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'SCC'))
                score.SCC{i} = SCC(double(img),double(imgRef));
                cd ../..
            end
            %% IFC
            if ismember('IFC',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method IFC Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'IFC'))
                score.IFC{i} = ifcvec(double(rgb2gray(imgRef)),double(rgb2gray(img)));
                cd ../..
            end
            %% MS-UNIQUE
            if ismember('MS-UNIQUE',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method MS-UNIQUE Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'MS-UNIQUE'))
                score.MSUNIQUE{i} = mslMSUNIQUE(imgRef,img);
                cd ../..
            end
            %% ReSIFT
            if ismember('ReSIFT',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method ReSIFT Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'ReSIFT'))
                score.ReSIFT{i} = mslReSIFT(imgRef,img);
                cd ../..
            end
            %% SUMMER
            if ismember('SUMMER',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method SUMMER Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'SUMMER'))
                score.SUMMER{i} = SUMMER(imgRef,img);
                cd ../..
            end
            %% PerSIM
            if ismember('PerSIM',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method PerSIM Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'PerSIM'))
                score.PerSIM{i} = msl_persim(imgRef,img);
                cd ../..
            end
        end
    end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


if ~isempty(images2)

    for i=1:x
        temp = 0;
        if size(images,4)>1
            img = images(:,:,:,i);
            img2 = images2(:,:,:,i);
        else
            img = imread(images{i});
            img2 = imread(images2{i});
        end

        %% BRISQUE
        if ismember('BRISQUE',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method BRISQUE Rates the image'," ",num2str(i),'/',num2str(x)))

            load(strcat(pwd,filesep,'IQA_Methods',filesep,'BRISQUE',filesep',strcat('model_',num2str(Flag),'.mat')))
            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'BRISQUE'))
            feat = brisque_feature(img);
            feat2 = brisque_feature(img2);
            feat = [feat feat2];
            feat(isnan(feat))=0;
            [score.BRISQUE{i}, ~, ~] = svmpredict(1,feat, model_Brisque ,'-q');
            cd ../..
        end
        %% FRIQUEE
        if ismember('FRIQUEE',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method FRIQUEE Rates the image'," ",num2str(i),'/',num2str(x)))

            load(strcat(pwd,filesep,'IQA_Methods',filesep,'FRIQUEE',filesep',strcat('model_',num2str(Flag),'.mat')))
            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'FRIQUEE'))
            feat = extractFRIQUEEFeatures(img);
            feat = feat.friqueeALL;
            feat2 = extractFRIQUEEFeatures(img2);
            feat2 = feat2.friqueeALL;
            feat = [feat feat2];
            feat(isnan(feat))=0;
            [score.FRIQUEE{i}, ~, ~] = svmpredict(1,feat, model_FRIQUEE ,' -q');
            cd ../..
        end
        %% BLINDER
        if ismember('BLINDER',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method BLINDER Rates the image'," ",num2str(i),'/',num2str(x)))

            if ~exist('model_Blinder','var')
                load(strcat(pwd,filesep,'IQA_Methods',filesep,'BLINDER',filesep',strcat('model_',num2str(Flag),'.mat')))
            end
            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'BLINDER'))
            score.BLINDER{i}= scoreBlinder(img,img2,model_Blinder,vgg16);
            cd ../..
        end
        %% GWH-GLBP-BIQA
        if ismember('GWH-GLBP-BIQA',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method GWH-GLBP-BIQA Rates the image'," ",num2str(i),'/',num2str(x)))

            load(strcat(pwd,filesep,'IQA_Methods',filesep,'GWH-GLBP-BIQA',filesep',strcat('model_',num2str(Flag),'.mat')))
            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'GWH-GLBP-BIQA'))
            feat = gwhglbp_feature(double(rgb2gray(img)));
            feat2 = gwhglbp_feature(double(rgb2gray(img2)));
            feat = [feat feat2];
            feat(isnan(feat))=0;
            [score.GWH_GLBP_BIQA{i}, ~, ~] = svmpredict(1,feat, model_gwhglbp ,' -q');
            cd ../..
        end
        %% MLPSIE
        if ismember('MLPSIE',IQA)
            temp = temp+1;
                      
            if tmp == 1
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method MLPSIE Rates the all image/s'))
                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE'))
                if ~exist('data','var')
                    data = load_h5_mlpsie(Flag);
                end
                tmp = tmp -1;
                tym_mlpsie = MLPSIE(images,images2,data);
                temp2 = tym_mlpsie';
                for q_tmp = 1: size(temp2,2)
                    score.MLPSIE{q_tmp} = temp2(q_tmp);
                end
                cd ../..
            end
        end
        %% NOREQI
        if ismember('NOREQI',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method NOREQI Rates the image'," ",num2str(i),'/',num2str(x)))

            load(strcat(pwd,filesep,'IQA_Methods',filesep,'NOREQI',filesep',strcat('model_',num2str(Flag),'.mat')))
            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'NOREQI'))
            feat = NOREQI(rgb2gray(img));
            feat2 = NOREQI(rgb2gray(img2));
            feat = [feat feat2];
            feat = double(normVec(feat,maxyO,minyO));
            feat(isnan(feat))=0;
            [score.NOREQI{i}, ~, ~] = svmpredict(1,feat, model_NOREQI ,' -q');
            cd ../..
        end
        %% SSEQ
        if ismember('SSEQ',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method SSEQ Rates the image'," ",num2str(i),'/',num2str(x)))

            load(strcat(pwd,filesep,'IQA_Methods',filesep,'SSEQ',filesep',strcat('model_',num2str(Flag),'.mat')))
            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'SSEQ'))
            feat=feature_extract_SEEQ(img,3);
            feat2=feature_extract_SEEQ(img2,3);
            feat = [feat feat2];
            feat=double(normVec(feat,maxyO,minyO));
            feat(isnan(feat))=0;
            [score.SSEQ{i}, ~, ~] = svmpredict(1,feat, model_SSEQ ,' -q');
            cd ../..
        end
        %% DIVINE
        if ismember('DIVINE',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method DIVINE Rates the image'," ",num2str(i),'/',num2str(x)))

            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'DIVINE'))
            scoreTmp = divine(rgb2gray(img));
            scoreTmp2 = divine(rgb2gray(img2));
            score.DIVINE{i} =sqrt(abs(scoreTmp*scoreTmp2));
            cd ../..
        end
        %% NIQE
        if ismember('NIQE',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method NIQE Rates the image'," ",num2str(i),'/',num2str(x)))

            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'NIQE'))
            load modelparameters.mat
            blocksizerow    = 96;
            blocksizecol    = 96;
            blockrowoverlap = 0;
            blockcoloverlap = 0;
            scoreTmp = computequalityNIQE((img),blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap,mu_prisparam,cov_prisparam);
            scoreTmp2 = computequalityNIQE((img2),blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap,mu_prisparam,cov_prisparam);
            score.NIQE{i}=sqrt(abs(scoreTmp*scoreTmp2));
            cd ../..
        end
        %% SR-metric
        if ismember('SR-metric',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method SR-metric Rates the image'," ",num2str(i),'/',num2str(x)))

            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'SR-metric'))
            scoreTmp = quality_predict_SR_metric(img);
            scoreTmp2 = quality_predict_SR_metric(img2);
            score.SR_metric{i} = sqrt(abs(scoreTmp*scoreTmp2));
            cd ../..
        end
        %% CEIQ
        if ismember('CEIQ',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method CEIQ Rates the image'," ",num2str(i),'/',num2str(x)))

            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'CEIQ'))
            scoreTmp = CEIQ(img);
            scoreTmp2 = CEIQ(img2);
            score.CEIQ{i} = sqrt(abs(scoreTmp*scoreTmp2));
            cd ../..
        end
        %% SINDEX
        if ismember('SINDEX',IQA)
            temp = temp+1;
            disp(strcat(num2str(temp),'/',num2str(val),' IQA method SINDEX Rates the image'," ",num2str(i),'/',num2str(x)))
            cd(strcat(pwd,filesep,'IQA_Methods',filesep,'SINDEX'))
            feat=s_index(img);
            feat2=s_index(img2);
            score.SINDEX{i} = sqrt(abs(feat*feat2));
            cd ../..
        end
        %%
        % Full reference
        if ~isempty(imagesRef2)


            if size(images,4)>1
                imgRef = imagesRef(:,:,:,i);
                imgRef2 = imagesRef2(:,:,:,i);
            else
                imgRef = imread(imagesRef{i});
                imgRef2 = imread(imagesRef2{i});
            end

            %% UNIQUE
            if ismember('UNIQUE',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method UNIQUE Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'UNIQUE'))
                scoreTmp = mslUNIQUE(imgRef,(img));
                scoreTmp2 = mslUNIQUE(imgRef2,(img2));
                score.UNIQUE{i} = sqrt(abs(scoreTmp*scoreTmp2));
                cd ../..
            end
            %% DISTS
            if ismember('DISTS',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method DISTS Rates the image'," ",num2str(i),'/',num2str(x)))

                net_params = load('./IQA_Methods/DISTS/weights/net_param.mat');
                weights = load('./IQA_Methods/DISTS/weights/alpha_beta.mat');
                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'DISTS'))
                resize_img = 0;
                use_gpu = 0;
                scoreTmp = DISTS(imgRef,(img),net_params,weights, resize_img, use_gpu);
                scoreTmp2 = DISTS(imgRef2,(img2),net_params,weights, resize_img, use_gpu);
                score.DISTS{i} = sqrt(abs(scoreTmp*scoreTmp2));
                cd ../..
            end
            %% VIF
            if ismember('VIF',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method VIF Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'VIF'))
                scoreTmp = vifvec(double(rgb2gray(imgRef)),double(rgb2gray(img)));
                scoreTmp2 = vifvec(double(rgb2gray(imgRef2)),double(rgb2gray(img2)));
                score.VIF{i} = sqrt(abs(scoreTmp*scoreTmp2));
                cd ../..
            end
            %% SSIM
            if ismember('SSIM',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method SSIM Rates the image'," ",num2str(i),'/',num2str(x)))

                scoreTmp =  ssim(imgRef,(img));
                scoreTmp2 =  ssim(imgRef2,(img2));
                score.SSIM{i} = sqrt(abs(scoreTmp*scoreTmp2));

            end
            %% MULTISSIM
            if ismember('MULTISSIM',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method MULTISSIM Rates the image'," ",num2str(i),'/',num2str(x)))

                scoreTmp =  mean(multissim(imgRef,(img)));
                scoreTmp2 =  mean(multissim(imgRef2,(img2)));
                score.MULTISSIM{i} =  sqrt(abs(scoreTmp*scoreTmp2));

            end
            %% MDSI
            if ismember('MDSI',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method MDSI Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'MDSI'))
                scoreTmp =  MDSI(imgRef,(img));
                scoreTmp2 =  MDSI(imgRef2,(img2));
                score.MDSI{i} =  sqrt(abs(scoreTmp*scoreTmp2));
                cd ../..
            end
            %% HaarPSI
            if ismember('HaarPSI',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method HaarPSI Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'HaarPSI'))
                scoreTmp =  HaarPSI(imgRef,(img));
                scoreTmp2 =  HaarPSI(imgRef2,(img2));
                score.HaarPSI{i} =  sqrt(abs(scoreTmp*scoreTmp2));
                cd ../..
            end
            %% SVD
            if ismember('SVD',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method SVD Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'SVD'))
                blkSize = 8;
                [~ ,scoreTmp] =  SVDQualityMeasure(imgRef,(img),blkSize);
                [~ ,scoreTmp2] =  SVDQualityMeasure(imgRef2,(img2),blkSize);
                score.SVD{i} =  sqrt(abs(scoreTmp*scoreTmp2));
                cd ../..
            end
            %% ERGAS
            if ismember('ERGAS',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method ERGAS Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'ERGAS'))
                ratio = 4;
                scoreTmp = ERGAS(imgRef,(img),ratio);
                scoreTmp2 = ERGAS(imgRef2,(img2),ratio);
                score.ERGAS{i} = sqrt(abs(scoreTmp*scoreTmp2));
                cd ../..
            end
            %% SAM
            if ismember('SAM',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method SAM Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'SAM'))
                scoreTmp = SAM(double(imgRef),double(img));
                scoreTmp2 = SAM(double(imgRef2),double(img2));
                score.SAM{i} = sqrt(abs(scoreTmp*scoreTmp2));
                cd ../..
            end
            %% Q2n
            if ismember('Q2n',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method Q2n Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'Q2n'))
                Qblocks_size = 32;
                scoreTmp = q2n(imgRef,(img),Qblocks_size,Qblocks_size);
                scoreTmp2 = q2n(imgRef2,(img2),Qblocks_size,Qblocks_size);
                score.Q2n{i} = sqrt(abs(scoreTmp*scoreTmp2));
                cd ../..
            end
            %% Q
            if ismember('Q',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method Q Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'Q'))
                L = 11;
                scoreTmp = Q(imgRef,(img),2^L);
                scoreTmp2 = Q(imgRef2,(img2),2^L);
                score.Q{i} = sqrt(abs(scoreTmp*scoreTmp2));
                cd ../..
            end
            %% SCC
            if ismember('SCC',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method SCC Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'SCC'))
                scoreTmp = SCC(double(img),double(imgRef));
                scoreTmp2 = SCC(double(img2),double(imgRef2));
                score.SCC{i} = sqrt(abs(scoreTmp*scoreTmp2));
                cd ../..
            end
            %% IFC
            if ismember('IFC',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method IFC Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'IFC'))
                scoreTmp = ifcvec(double(rgb2gray(imgRef)),double(rgb2gray(img)));
                scoreTmp2 = ifcvec(double(rgb2gray(imgRef2)),double(rgb2gray(img2)));
                score.IFC{i} = sqrt(abs(scoreTmp*scoreTmp2));
                cd ../..
            end
            %% MS-UNIQUE
            if ismember('MS-UNIQUE',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method MS-UNIQUE Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'MS-UNIQUE'))
                scoreTmp   = mslMSUNIQUE(imgRef,img);
                scoreTmp2   = mslMSUNIQUE(imgRef2,img2);
                score.MSUNIQUE{i} = sqrt(abs(scoreTmp*scoreTmp2));
                cd ../..
            end
            %% ReSIFT
            if ismember('ReSIFT',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method ReSIFT Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'ReSIFT'))
                scoreTmp   = mslReSIFT(imgRef,img);
                scoreTmp2   = mslReSIFT(imgRef2,img2);
                score.ReSIFT{i} = sqrt(abs(scoreTmp*scoreTmp2));
                cd ../..
            end
            %% SUMMER
            if ismember('SUMMER',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method SUMMER Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'SUMMER'))
                scoreTmp   = SUMMER(imgRef,img);
                scoreTmp2   = SUMMER(imgRef2,img2);
                score.SUMMER{i} = sqrt(abs(scoreTmp*scoreTmp2));
                cd ../..
            end
            %% PerSIM
            if ismember('PerSIM',IQA)
                temp = temp+1;
                disp(strcat(num2str(temp),'/',num2str(val),' IQA method PerSIM Rates the image'," ",num2str(i),'/',num2str(x)))

                cd(strcat(pwd,filesep,'IQA_Methods',filesep,'PerSIM'))
                scoreTmp   = msl_persim(imgRef,img);
                scoreTmp2   = msl_persim(imgRef2,img2);
                score.PerSIM{i} = sqrt(abs(scoreTmp*scoreTmp2));
                cd ../..
            end
        end
    end
end
disp('-----------Done rates the image/s-----------')