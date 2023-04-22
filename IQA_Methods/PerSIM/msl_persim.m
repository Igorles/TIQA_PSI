  function [outCT] =msl_persim(img1, img2)
%%
%  Author:              Dogancan Temel
%  PI:                  Ghassan AlRegib
%  Version:             1.0
%  Published in:        IEEE International Conference Image Processing (ICIP) 
%  Publication details: Vol., no., pp.1682-1686, 27-30 Sept. 2015
%%
%  Input:               Reference and distorted images
%  Output:              PerSIM score
%%  Computation of LoG and chroma feature maps
[s1,s2,~]=size(img1);
% Define filter type as LoG
filterType='log';
% Initialize standard deviation of the Gaussian function
stdGauss= 10;
% Define Gaussian filter with blocksize [13,13]
h = fspecial(filterType, [13 13], stdGauss);
% Define T1 to avoid instabilities when denominator is close to 0 
T1=0.001;
outBound='symmetric';
%RGB to La*b* color transformation
colorTransform = makecform('srgb2lab');
temp = double(applycform(img1, colorTransform));
img1a=temp(:,:,2);
img1b=temp(:,:,3);
img1l=temp(:,:,1);
temp = double(applycform(img2, colorTransform));
img2a=temp(:,:,2);
img2b=temp(:,:,3);
img2l=temp(:,:,1);
% Similarity calculation in chroma channels (a*,b*)
aSIM=abs((2 * (img1a) .* (img2a) + T1)./((img1a).^2 + (img2a).^2 + T1));
bSIM=abs((2 * (img1b) .* (img2b) + T1)./((img1b).^2 + (img2b).^2 + T1));
%LoG feature map extraction
img1DoG_L=imfilter(double(img1l),h,outBound);
img2DoG_L=imfilter(double(img2l),h,outBound);
%LoG feature map similarity calculation
lSIM=abs((2 * (img1DoG_L) .* (img2DoG_L) + T1)./((img1DoG_L).^2 + (img2DoG_L).^2 + T1));
%% Computation of LoG and chroma feature maps in lower resolution
stdGauss= 8;
h = fspecial(filterType, [4, 4], stdGauss);
img1_0_6=imresize(img1,0.6);  
img2_0_6=imresize(img2,0.6);   
temp = double(applycform(img1_0_6, colorTransform));
img1a=temp(:,:,2);
img1b=temp(:,:,3);
img1l=temp(:,:,1);
temp = double(applycform(img2_0_6, colorTransform));
img2a=temp(:,:,2);
img2b=temp(:,:,3);
img2l=temp(:,:,1);
aSIM_0_6=abs((2 * (img1a) .* (img2a) + T1)./((img1a).^2 + (img2a).^2 + T1));
bSIM_0_6=abs((2 * (img1b) .* (img2b) + T1)./((img1b).^2 + (img2b).^2 + T1));
img1DoG_L=imfilter(double(img1l),h,outBound);
img2DoG_L=imfilter(double(img2l),h,outBound);
lSIM_0_6=abs((2 * (img1DoG_L) .* (img2DoG_L) + T1)./((img1DoG_L).^2 + (img2DoG_L).^2 + T1));
lSIM_0_6=abs(imresize(lSIM_0_6,[s1 s2]));  
aSIM_0_6=abs(imresize(aSIM_0_6,[s1 s2]));
bSIM_0_6=abs(imresize(bSIM_0_6,[s1 s2]));
%% Computation of LoG and chroma feature maps in lower resolution
stdGauss= 7;
h = fspecial(filterType, [2, 2], stdGauss);
img1_0_4=imresize(img1,0.4);  
img2_0_4=imresize(img2,0.4);   
temp = double(applycform(img1_0_4, colorTransform));
img1a=temp(:,:,2);
img1b=temp(:,:,3);
img1l=temp(:,:,1);
temp = double(applycform(img2_0_4, colorTransform));
img2a=temp(:,:,2);
img2b=temp(:,:,3);
img2l=temp(:,:,1);
aSIM_0_4=abs((2 * (img1a) .* (img2a) + T1)./((img1a).^2 + (img2a).^2 + T1));
bSIM_0_4=abs((2 * (img1b) .* (img2b) + T1)./((img1b).^2 + (img2b).^2 + T1));
img1DoG_L=imfilter(double(img1l),h,outBound);
img2DoG_L=imfilter(double(img2l),h,outBound);
lSIM_0_4=abs((2 * (img1DoG_L) .* (img2DoG_L) + T1)./((img1DoG_L).^2 + (img2DoG_L).^2 + T1));
lSIM_0_4=abs(imresize(lSIM_0_4,[s1 s2]));  
aSIM_0_4=abs(imresize(aSIM_0_4,[s1 s2]));
bSIM_0_4=abs(imresize(bSIM_0_4,[s1 s2]));
%% Pooling multiple resolution feature maps to obtain PerSIM score
lSUM=nthroot(lSIM.*lSIM_0_6.*lSIM_0_4,3);
aSUM=nthroot(aSIM.*aSIM_0_6.*aSIM_0_4,3);
bSUM=nthroot(bSIM.*bSIM_0_6.*bSIM_0_4,3);
outCT=mean2(min(lSUM.^4,min(aSUM.^2,bSUM.^2)))^25;
  end