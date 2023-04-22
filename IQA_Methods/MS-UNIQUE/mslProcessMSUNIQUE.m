function feature = mslProcessMSUNIQUE(img,W1,b1,Ind1,W2,b2,Ind2,W3,b3,Ind3,W4,b4,Ind4,W5,b5,Ind5)
%%
%  Author:              Mohit Prabhushankar
%  PI:                  Ghassan AlRegib
%  Version:             1.0
%  Published in:        
%  Publication details: 
%%
I = im2double(img);

%Parameter Initialisation
[m,n,~] = size(I);
epsilon = 0.1; 
count = 1; 
scale = 8;

%Convert m x n x 3 image into [(8x8x3) x count] patches
i = 1;
while (i < m - (scale - 2))
    j = 1;
    while (j< n-(scale-2)) %(j < 512)
        patch_temp = I(i:i+(scale-1),j:j+(scale-1),:);
        patches(:,count) = reshape(patch_temp,[],1);
        count = count+1;
        j = j+scale;
    end    
    i = i+scale;
end

% Subtract mean patch (hence zeroing the mean of the patches)
meanPatch = mean(patches,2);  
patches = bsxfun(@minus, patches, meanPatch);

% Apply ZCA whitening
sigma = patches * patches' / (count-1);
[u, s, ~] = svd(sigma);
ZCAWhite = u * diag(1 ./ sqrt(diag(s) + epsilon)) * u';
patches = ZCAWhite * patches;

%Process the patches using the different models and multiply 
%resultant by the sharpness indices
feature1 = mslComputeMSUNIQUE(patches,W1,b1,Ind1);
feature2 = mslComputeMSUNIQUE(patches,W2,b2,Ind2);
feature3 = mslComputeMSUNIQUE(patches,W3,b3,Ind3);
feature4 = mslComputeMSUNIQUE(patches,W4,b4,Ind4);
feature5 = mslComputeMSUNIQUE(patches,W5,b5,Ind5);

feature_full = [feature1;feature2;feature3;feature4;feature5];

%Reshaping back to a single vector
feature = reshape(feature_full,[],1);

end