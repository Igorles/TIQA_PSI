function score = scoreBlinder(img,img2,models,nameNetwork)

% if length(img) == 2
if ~isempty(img2)
net = BlinderNetwork(nameNetwork);
features = featuresBlinderExtraction(img,net);
features2 = featuresBlinderExtraction(img2,net);
tmp = [features;features2];
else
% elseif length(img) == 1
net = BlinderNetwork(nameNetwork);
features = featuresBlinderExtraction(img,net);
tmp = [features;features];
% else
%     error('Not supported more than 2 images') 
end

for i=1:length(net.Lengths)
    tym = tmp(:,i);
    feat{i} = horzcat(tym{:});
end

for i=1:length(models)

    SubScore{i} = predict(models{i}, feat{i});

end

val = cell2mat(SubScore);
val = sum(val,2);
score = val ./ length(models);

end