function  features = featuresBlinderExtraction(img,Constants)

if ischar(img) || isStringScalar(img)
imgDist = imread(img);
else
imgDist = img;
end
for i=1:length(Constants.Layers)
    features{i} = featuresExtractor(imgDist, Constants, i);
end

end