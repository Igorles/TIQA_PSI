function [model,Constants] = createModelsBlinder(imgTC,imgPC,mosPC_TC)

Constants = BlinderNetwork(vgg16);

for i=1:length(imgTC)
    featuresTC = featuresBlinderExtraction(imgTC{i},Constants);
    featuresPC = featuresBlinderExtraction(imgPC{i},Constants);
    features{i}=cellfun(@(x,y)[x y],featuresTC,featuresPC,'un',0);
end

featurestmp = vertcat(features{:});

for i=1:length(Constants.Lengths)
    tym = featurestmp(:,i);
    feat{i} = vertcat(tym{:});
end

for i=1:length(Constants.Layers)

    trainFeatures = feat{i};
    model{i} = fitrsvm(trainFeatures, mosPC_TC, 'KernelFunction', 'rbf', 'KernelScale', 'auto');
    
end




