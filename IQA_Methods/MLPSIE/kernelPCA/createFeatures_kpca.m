function [results] = createFeatures_kpca(data,obj)

if size(data,2) ~= size(obj.data,2)
obj.data = obj.data(:,1:size(data,2));
end

Kt = data*obj.data';
unit = ones(size(data, 1), obj.numSamples)/obj.numSamples;
Kt_c = Kt-unit*obj.temporary.K-Kt*obj.temporary.unit+unit*obj.temporary.K*obj.temporary.unit;
results.featuresTest = Kt_c*obj.coefficient(:, 1:obj.numComponents);

end