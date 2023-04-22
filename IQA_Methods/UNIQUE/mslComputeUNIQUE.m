function feature = mslComputeUNIQUE(patches,weight,bias)

    feature = weight * patches + repmat(bias,1,size(patches,2));
    feature = 1./(1 + exp(-(feature)));    
    
end
