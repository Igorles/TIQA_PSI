function feature = mslComputeMSUNIQUE(patches,weight,bias,Indices)

    feature = weight * patches + repmat(bias,1,size(patches,2));
    feature = 1./(1 + exp(-(feature)));    
    feature = feature.*(repmat(Indices,1,size(patches,2)));
    
end
