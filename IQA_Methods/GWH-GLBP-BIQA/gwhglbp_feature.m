function [ feat ] = gwhglbp_feature( imdist )

%  GWHGLBP_FEATURE - extracts quality-aware features based on image structural and contrast information. 

% inputs:
% imdist - the distorted image (grayscale image, double type, 0~255)

% outputs:
% 50-d features. 

% This is an implementation of the NR IQA algorithm in the following paper:
%  Q. Li, W. Lin, and Y. Fang. "No-reference quality assessment for multiply-distorted images in gradient domain," in IEEE Signal Processing Letters , vol.PP, no.99, pp.1-1
%  doi: 10.1109/LSP.2016.2537321

scalenum = 5;
feat = [];


%% prewitt operator %%%%%
dx = [1 0 -1; 1 0 -1; 1 0 -1]/3;
dy = dx';

R = 1; P = 8;
lbp_type = { 'ri' 'u2' 'riu2' };
y = 3;
mtype = lbp_type{y};
MAPPING = getmapping( P, mtype );

for itr_scale = 1:scalenum
    
    %%%%%%%%%% Gradient LBP %%%%%%%%%%%%
    IxY1 = conv2(imdist, dx, 'same');
    IyY1 = conv2(imdist, dy, 'same');
    gradientMap = sqrt(IxY1.^2 + IyY1.^2);    
    LBPMap = lbp_new(gradientMap,R,P,MAPPING,'x');
    
    %%%%%% gradient magnitude weighted GLBP %%%%%
    wLBPHist = [];
    weightmap = gradientMap;
    wintesity = weightmap(2:end-1, 2:end-1);
    wintensity = abs(wintesity);
    for k = 1:max(LBPMap(:))+1
        idx = find(LBPMap == k-1);
        kval = sum(wintensity(idx));
        wLBPHist = [wLBPHist kval];
    end
    
    wLBPHist = wLBPHist/sum(wLBPHist);
    feat = [feat wLBPHist];
    
    
    imdist = imresize(imdist, 0.5);
end
end


