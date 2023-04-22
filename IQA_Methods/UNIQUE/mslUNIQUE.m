function result = mslUNIQUE(img1,img2)
%%
%  Author:              Mohit Prabhushankar
%  PI:                  Ghassan AlRegib
%  Version:             1.0
%  Published in:        Signal Processing Letter October 2016
%  Publication details: 

%%
%Resize image to 0.5 times the original size - Faster processing
%and HVS is more adapted to low frequency components
image1 = imresize(img1,0.5);
image2 = imresize(img2,0.5);

%Loading Precalculated weights and bias
workspace = load('InputWeights/ImageNet_Weights_YGCr.mat');        
weight = workspace.W;  
bias = workspace.b;

%ColorSpace transformation
img1 = rgb2ycbcr(image1);
img2 = rgb2ycbcr(image2);
img1(:,:,2) = image1(:,:,2);
img2(:,:,2) = image2(:,:,2);     
          
%Preparing images (Zero centering and ZCA whitening) and
%multiplying by weights and adding bias
img1_s = mslProcessUNIQUE(img1,weight,bias);
img2_s = mslProcessUNIQUE(img2,weight,bias);

%Discount those features that are much lesser than average
%activation(0.035) - Suppression
res = find(img1_s < 0.025);
if (sum(res) > 0)              
    img1_s(res) = 0;              
end

res = find(img2_s < 0.025);
if (sum(res) > 0)              
    img2_s(res) = 0;              
end  
    
%Pooling using 10th power of Spearman Correlation coefficient
result = abs(corr(img1_s,img2_s,'type','Spearman'))^10;

end          