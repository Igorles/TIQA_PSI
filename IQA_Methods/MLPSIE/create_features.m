function [data] = create_features(TC_names,PC_names,DMOS_PC_TC)

addpath('.\libsvm-3.22\libsvm-3.22');

addpath(genpath('./kernelPCA'));

randn('seed',0);
rand('seed',0);
warning('off','all')

%% choose only convolution layers from resnet18 nad vgg19
Constants.net = vgg19;
j=1;
for i=2:size(Constants.net.Layers,1)-1
    tmp=Constants.net.Layers(i);
    if(contains(tmp.Name, 'drop'))

    else
        Constants.Layers{j}=tmp.Name;
        if(isprop(tmp,'Bias')&&size(tmp.Bias,3)~=1)
            Constants.Lengths{j}=size(tmp.Bias,3);
        elseif(isprop(tmp,'Bias')&&size(tmp.Bias,3)==1)
            Constants.Lengths{j}=size(tmp.Bias,1);
        else
            Constants.Lengths{j}=Constants.Lengths{j-1};
        end
        j=j+1;
    end
end
num=0;
name=[];
for ii = 1:size(Constants.net.Layers,1)
    props = properties(Constants.net.Layers(ii));
    for p = 1:numel(props)
        propName = props{p};
        if ~isempty(regexp(propName, 'Stride$', 'once'))%, 'once'))
            if ~ (Constants.net.Layers(ii).Name== "output")
                num=num+1;
                name2=convertCharsToStrings(Constants.net.Layers(ii).Name);
                name =[name;name2];
            end

        end

    end
end

tmp = ismember(Constants.Layers, name);
Constants.Layers = Constants.Layers(tmp);
Constants.Lengths = Constants.Lengths(tmp);
num=0;
name_2=[];
for ii = 1:size(Constants.net.Layers,1)
    props = properties(Constants.net.Layers(ii));
    for p = 1:numel(props)
        propName = props{p};
        if (~isempty(regexp(propName, 'NumChannels$', 'once')) || ~isempty(regexp(propName, 'NumChannelsPerGroup$', 'once')))%, 'once'))
            if ~ (Constants.net.Layers(ii).Name== "output")
                num=num+1;
                name2=convertCharsToStrings(Constants.net.Layers(ii).Name);
                name_2 =[name_2;name2];
            end

        end

    end
end
tmp = ismember(Constants.Layers, name_2);
Constants.Layers = Constants.Layers(tmp);
Constants.Lengths = Constants.Lengths(tmp);

Constants2.net = resnet18;
j=1;
for i=2:size(Constants2.net.Layers,1)-1
    tmp=Constants2.net.Layers(i);
    if(contains(tmp.Name, 'drop'))

    else
        Constants2.Layers{j}=tmp.Name;
        if(isprop(tmp,'Bias')&&size(tmp.Bias,3)~=1)
            Constants2.Lengths{j}=size(tmp.Bias,3);
        elseif(isprop(tmp,'Bias')&&size(tmp.Bias,3)==1)
            Constants2.Lengths{j}=size(tmp.Bias,1);
        else
            Constants2.Lengths{j}=Constants2.Lengths{j-1};
        end
        j=j+1;
    end
end
num=0;
name=[];
for ii = 1:size(Constants2.net.Layers,1)
    props = properties(Constants2.net.Layers(ii));
    for p = 1:numel(props)
        propName = props{p};
        if ~isempty(regexp(propName, 'Stride$', 'once'))%, 'once'))
            if ~ (Constants2.net.Layers(ii).Name== "output")
                num=num+1;
                name2=convertCharsToStrings(Constants2.net.Layers(ii).Name);
                name =[name;name2];
            end

        end

    end
end
tmp = ismember(Constants2.Layers, name);
Constants2.Layers = Constants2.Layers(tmp);
Constants2.Lengths = Constants2.Lengths(tmp);
num=0;
name_2=[];
for ii = 1:size(Constants2.net.Layers,1)
    props = properties(Constants2.net.Layers(ii));
    for p = 1:numel(props)
        propName = props{p};
        if (~isempty(regexp(propName, 'NumChannels$', 'once')) || ~isempty(regexp(propName, 'NumChannelsPerGroup$', 'once')))%, 'once'))
            if ~ (Constants2.net.Layers(ii).Name== "output")
                num=num+1;
                name2=convertCharsToStrings(Constants2.net.Layers(ii).Name);
                name_2 =[name_2;name2];
            end

        end

    end
end

tmp = ismember(Constants2.Layers, name_2);
Constants2.Layers = Constants2.Layers(tmp);
Constants2.Lengths = Constants2.Lengths(tmp);
%% read images
for i=1:size(TC_names,1)
    imgDist          = imread( TC_names{i});
    r = centerCropWindow2d(size(imgDist),Constants.net.Layers(1, 1).InputSize);
    imgDist1_TC{i} = imcrop(imgDist,r);

    imgDist          = imread( PC_names{i});
    r = centerCropWindow2d(size(imgDist),Constants.net.Layers(1, 1).InputSize);
    imgDist2_PC{i} = imcrop(imgDist,r);

end
%%

%% extract features
for numberLayer =   1 : size(Constants.Lengths,2)

%     fprintf('Processing Vgg19 layers %d / %d\n', numberLayer,size(Constants.Lengths,2));

    for ii=1:size(TC_names,1)

        actValues_tym= activations(Constants.net, imgDist1_TC{ii}, Constants.Layers{numberLayer},'OutputAs','rows');
        actValues= activations(Constants.net, imgDist2_PC{ii}, Constants.Layers{numberLayer},'OutputAs','rows');
        matrixIamgesFeatures{ii,:} = [actValues actValues_tym];

    end
    featuresTrainNetVgg19{numberLayer} = cell2mat(matrixIamgesFeatures);
end

for numberLayer =   1 : size(Constants2.Lengths,2)

%     fprintf('Processing Resnet18 layers %d / %d\n', numberLayer,size(Constants2.Lengths,2));

    for ii=1:size(TC_names,1)

        actValues_tym= activations(Constants2.net, imgDist1_TC{ii}, Constants2.Layers{numberLayer},'OutputAs','rows');
        actValues= activations(Constants2.net, imgDist2_PC{ii}, Constants2.Layers{numberLayer},'OutputAs','rows');

        matrixIamgesFeatures{ii,:} = [actValues actValues_tym];

    end
    featuresTrainNetResnet18{numberLayer} = cell2mat(matrixIamgesFeatures);

end

%%

kernel = Kernel('type', 'linear');
parameter = struct('numComponents', 15,'kernelFunc', kernel);

for numberLayer = 1 : size(Constants.Lengths,2)
%     fprintf('Processing Vgg19 features %d / %d\n', numberLayer,size(Constants.Lengths,2));

    trainVector = featuresTrainNetVgg19{numberLayer};

    minyO=min(trainVector);  %1) Different features have different ranges. Find them.
    maxyO=max(trainVector);
    trainVector =normMe(trainVector,maxyO,minyO);  %2) Normalize them to [0 1].

    kpca = KernelPCA(parameter);
    % train KPCA model
    kpca.train(trainVector);

    % test KPCA model
    kpca2.coefficient = kpca.coefficient;
    kpca2.data = kpca.data;
    kpca2.numSamples = kpca.numSamples;
    kpca2.temporary = kpca.temporary;
    kpca2.numComponents = kpca.numComponents;
    kpca2.featuresTrain = kpca.score;
    kpca2.maxyO = maxyO;
    kpca2.minyO = minyO;

    TrainedKpca{1}{numberLayer}  = kpca2;

end

for numberLayer = 1: size(Constants2.Lengths,2)

%     fprintf('Processing Resnet18 features %d / %d\n', numberLayer,size(Constants2.Lengths,2));

    trainVector = featuresTrainNetResnet18{numberLayer};

    minyO=min(trainVector);  %1) Different features have different ranges. Find them.
    maxyO=max(trainVector);
    trainVector =normMe(trainVector,maxyO,minyO);  %2) Normalize them to [0 1].

    kpca = KernelPCA(parameter);
    kpca.train(trainVector);

    kpca2.coefficient = kpca.coefficient;
    kpca2.data = kpca.data;
    kpca2.numSamples = kpca.numSamples;
    kpca2.temporary = kpca.temporary;
    kpca2.numComponents = kpca.numComponents;
    kpca2.featuresTrain = kpca.score;
    kpca2.maxyO = maxyO;
    kpca2.minyO = minyO;

    TrainedKpca{2}{numberLayer}  = kpca2;


end

data.TrainedKpca = TrainedKpca;
data.ConstantsNetVgg19 = Constants;
data.ConstantsNetResnet18 = Constants2;
data.DMOS_PC_TC = DMOS_PC_TC;

end

