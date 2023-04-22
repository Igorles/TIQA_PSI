function [output] = MLPSIE(imgPC,imgTC,data)
%MLPSIE Summary of this function goes here
%Author: Igor Stępień.

%% read images
if size(imgTC,4) == 1
    if (~iscell(imgTC) || (isstring(imgTC) || ischar(imgTC)))
        imgDist=imgTC;

        if (size(imgDist,1)<224 || size(imgDist,2)<224)
            imgDist1_TC = imresize(imgDist,[224 224]);
        else
            r = centerCropWindow2d(size(imgDist),data.ConstantsNetVgg19.net.Layers(1, 1).InputSize);
            imgDist1_TC = imcrop(imgDist,r);
        end
    else
        if size(imgTC,1)==1
            imgDist = imread(imgTC);

            if (size(imgDist,1)<224 || size(imgDist,2)<224)
                imgDist1_TC = imresize(imgDist,[224 224]);
            else
                r = centerCropWindow2d(size(imgDist),data.ConstantsNetVgg19.net.Layers(1, 1).InputSize);
                imgDist1_TC = imcrop(imgDist,r);
            end
        else
            for i=1:size(imgTC,1)
                imgDist = imread(imgTC{i});
                if (size(imgDist,1)<224 || size(imgDist,2)<224)
                    imgDist1_TC{i} = imresize(imgDist,[224 224]);
                else
                    r = centerCropWindow2d(size(imgDist),data.ConstantsNetVgg19.net.Layers(1, 1).InputSize);
                    imgDist1_TC{i} = imcrop(imgDist,r);
                end
            end
        end
    end
else

    for i=1:size(imgTC,4)
        imgDist =  imgTC(:,:,:,i);
        if (size(imgDist,1)<224 || size(imgDist,2)<224)
            imgDist_TC{i} = imresize(imgDist,[224 224]);
        else
            r = centerCropWindow2d(size(imgDist),data.ConstantsNetVgg19.net.Layers(1, 1).InputSize);
            imgDist_TC{i} = imcrop(imgDist,r);
        end

    end

end


if size(imgTC,4) == 1
    if (~iscell(imgTC) || (isstring(imgPC) || ischar(imgPC)))
        imgDist=imgPC;
        if (size(imgDist,1)<224 || size(imgDist,2)<224)
            imgDist2_PC = imresize(imgDist,[224 224]);
        else
            r = centerCropWindow2d(size(imgDist),data.ConstantsNetVgg19.net.Layers(1, 1).InputSize);
            imgDist2_PC = imcrop(imgDist,r);
        end
    else
        if size(imgPC,1)==1
            imgDist = imread( strcat(Directory, filesep, imgPC));
            if (size(imgDist,1)<224 || size(imgDist,2)<224)
                imgDist2_PC = imresize(imgDist,[224 224]);
            else
                r = centerCropWindow2d(size(imgDist),data.ConstantsNetVgg19.net.Layers(1, 1).InputSize);
                imgDist2_PC = imcrop(imgDist,r);
            end
        else
            for i=1:size(imgPC,1)
                imgDist = imread(imgPC{i});
                if (size(imgDist,1)<224 || size(imgDist,2)<224)
                    imgDist2_PC{i} = imresize(imgDist,[224 224]);
                else
                    r = centerCropWindow2d(size(imgDist),data.ConstantsNetVgg19.net.Layers(1, 1).InputSize);
                    imgDist2_PC{i} = imcrop(imgDist,r);
                end
            end
        end
    end
else

    for i=1:size(imgTC,4)
        imgDist =  imgPC(:,:,:,i);
        if (size(imgDist,1)<224 || size(imgDist,2)<224)
            imgDist2_PC{i} = imresize(imgDist,[224 224]);
        else
            r = centerCropWindow2d(size(imgDist),data.ConstantsNetVgg19.net.Layers(1, 1).InputSize);
            imgDist2_PC{i} = imcrop(imgDist,r);
        end
    end
end

%%
%%
if size(imgTC,4) == 1
    if isstring(imgTC) || ischar(imgTC) || size(imgTC,1)==1 || size(imgTC,3)==3
        for numberLayer =   1 : size(data.ConstantsNetVgg19.Lengths,2)

            %         fprintf('Processing Vgg19 layers %d / %d\n', numberLayer,size(data.ConstantsNetVgg19.Lengths,2));

            actValues_temp= activations(data.ConstantsNetVgg19.net, imgDist1_TC, data.ConstantsNetVgg19.Layers{numberLayer},'OutputAs','rows');
            actValues= activations(data.ConstantsNetVgg19.net, imgDist2_PC, data.ConstantsNetVgg19.Layers{numberLayer},'OutputAs','rows');
            matrixIamgesFeatures = [actValues actValues_temp];

            vectors_train_VGG19{numberLayer} = matrixIamgesFeatures;
        end

        for numberLayer =   1 : size(data.ConstantsNetResnet18.Lengths,2)

            %         fprintf('Processing Resnet18 layers %d / %d\n', numberLayer,size(data.ConstantsNetResnet18.Lengths,2));

            actValues_temp= activations(data.ConstantsNetResnet18.net, imgDist1_TC, data.ConstantsNetResnet18.Layers{numberLayer},'OutputAs','rows');
            actValues= activations(data.ConstantsNetResnet18.net, imgDist2_PC, data.ConstantsNetResnet18.Layers{numberLayer},'OutputAs','rows');

            matrixIamgesFeatures = [actValues actValues_temp];

            vectors_train_Resnet18{numberLayer} = matrixIamgesFeatures;

        end
    else

        for i =1:size(imgTC,1)

            %         fprintf('Net Vgg19 Processing images %d / %d\n', i,size(imgTC,1));

            for numberLayer =   1 : size(data.ConstantsNetVgg19.Lengths,2)

                actValues_tym= activations(data.ConstantsNetVgg19.net, imgDist1_TC{i}, data.ConstantsNetVgg19.Layers{numberLayer},'OutputAs','rows');
                actValues= activations(data.ConstantsNetVgg19.net, imgDist2_PC{i}, data.ConstantsNetVgg19.Layers{numberLayer},'OutputAs','rows');
                matrixIamgesFeatures = [actValues actValues_tym];

                vectors_train_VGG19{numberLayer}(i,:) = matrixIamgesFeatures;
            end
        end

        for i =1:size(imgTC,1)

            %         fprintf('Net Resnet18 Processing images %d / %d\n', i,size(imgTC,1));

            for numberLayer =   1 : size(data.ConstantsNetResnet18.Lengths,2)

                actValues_tym= activations(data.ConstantsNetResnet18.net, imgDist1_TC{i}, data.ConstantsNetResnet18.Layers{numberLayer},'OutputAs','rows');
                actValues= activations(data.ConstantsNetResnet18.net, imgDist2_PC{i}, data.ConstantsNetResnet18.Layers{numberLayer},'OutputAs','rows');
                matrixIamgesFeatures = [actValues actValues_tym];

                vectors_train_Resnet18{numberLayer}(i,:) = matrixIamgesFeatures;

            end
        end
    end
else

    for i =1:size(imgTC,4)

        %         fprintf('Net Vgg19 Processing images %d / %d\n', i,size(imgTC,1));

        for numberLayer =   1 : size(data.ConstantsNetVgg19.Lengths,2)

            actValues_tym= activations(data.ConstantsNetVgg19.net, imgDist1_TC{i}, data.ConstantsNetVgg19.Layers{numberLayer},'OutputAs','rows');
            actValues= activations(data.ConstantsNetVgg19.net, imgDist2_PC{i}, data.ConstantsNetVgg19.Layers{numberLayer},'OutputAs','rows');
            matrixIamgesFeatures = [actValues actValues_tym];

            vectors_train_VGG19{numberLayer}(i,:) = matrixIamgesFeatures;
        end
    end

    for i =1:size(imgTC,4)

        %         fprintf('Net Resnet18 Processing images %d / %d\n', i,size(imgTC,1));

        for numberLayer =   1 : size(data.ConstantsNetResnet18.Lengths,2)

            actValues_tym= activations(data.ConstantsNetResnet18.net, imgDist1_TC{i}, data.ConstantsNetResnet18.Layers{numberLayer},'OutputAs','rows');
            actValues= activations(data.ConstantsNetResnet18.net, imgDist2_PC{i}, data.ConstantsNetResnet18.Layers{numberLayer},'OutputAs','rows');
            matrixIamgesFeatures = [actValues actValues_tym];

            vectors_train_Resnet18{numberLayer}(i,:) = matrixIamgesFeatures;

        end
    end

end
%%
for numberLayer =   1 : size(data.ConstantsNetVgg19.Lengths,2)
    %     fprintf('Processing Vgg19 features %d / %d\n', numberLayer,size(data.ConstantsNetVgg19.Lengths,2));

    testVector =normMe(vectors_train_VGG19{numberLayer},data.TrainedKpca{1}{numberLayer}.maxyO,data.TrainedKpca{1}{numberLayer}.minyO);
    results = createFeatures_kpca(testVector,data.TrainedKpca{1}{numberLayer});
    featuresTestNetVgg19{numberLayer} = results;

end

for numberLayer =   1 : size(data.ConstantsNetResnet18.Lengths,2)
    %     fprintf('Processing Resnet18 features %d / %d\n', numberLayer,size(data.ConstantsNetResnet18.Lengths,2));

    testVector =normMe(vectors_train_Resnet18{numberLayer},data.TrainedKpca{2}{numberLayer}.maxyO,data.TrainedKpca{2}{numberLayer}.minyO);
    results = createFeatures_kpca(testVector,data.TrainedKpca{2}{numberLayer});
    featuresTestNetResnet18{numberLayer} = results;

end
xtest =[];
xtrain = [];
for i=1: size(data.ConstantsNetVgg19.Lengths,2)
    xtest = [xtest featuresTestNetVgg19{i}.featuresTest];
end

for i =1:size(data.ConstantsNetVgg19.Lengths,2)
    xtrain = [xtrain data.TrainedKpca{1}{i}.featuresTrain];
end

for i=1:size(data.ConstantsNetResnet18.Lengths,2)
    xtest = [xtest featuresTestNetResnet18{i}.featuresTest];
end
for i =1:size(data.ConstantsNetResnet18.Lengths,2)
    xtrain = [xtrain data.TrainedKpca{2}{i}.featuresTrain];
end

parameter =  [0.018,0.05,100];

new_DMOS_PC_TC = data.DMOS_PC_TC; %sqrt(dmos_train);
testMos = zeros(size(xtest,1),1);%we don't need dmos test
output = fun_svr2_score(xtrain,xtest,testMos,new_DMOS_PC_TC,parameter(1,1),parameter(1,3),parameter(1,2));


end

