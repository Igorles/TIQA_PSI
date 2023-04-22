addpath(genpath('Tools'));
load Mos_imgs.mat
load(strcat(pwd,filesep,'Database',filesep,'Dataset',filesep,'Test(HxWxC)_wv2_data1.mat'))
IQA = { %Full-Reference methods 18
    'VIF','SSIM','SAM','HaarPSI','MDSI',...
    ... 'DISTS', 'ERGAS', 'IFC', 'MS-UNIQUE', 'Q', 'Q2n', 'ReSIFT', 'SCC', 'SUMMER', 'SVD', 'MULTISSIM', 'PerSIM', 'UNIQUE',...	
    ... No-Reference methods 13
    'BLINDER','DIVINE','MLPSIE','SINQ'
    ... 'BRISQUE', 'CEIQ', 'FRIQUEE', 'GWH-GLBP-BIQA', 'NIQE', 'NOREQI', 'SINDEX', 'SR-metric', 'SSEQ',
     };
PC_img = strcat(pwd,filesep,'Database',filesep,'SS',filesep,PC_img); 
TC_img = strcat(pwd,filesep,'Database',filesep,'SS',filesep,TC_img);
%Create Svr models for IQA methods, where 0 is the svr model name 
Create_Svr_Models(PC_img,TC_img,DMOS_PC_TC,0,IQA)
%Pan-Sharpening algorithms 
algorithms = {... Require REF
    'REF','EXP','AWLP','BDSD','MTF-GLP','MF'    
    ... 'C-BDSD', 'BDSD_PC', 'BT-H', 'C-GSA', 'SR-D', 'MTF-GLP-FS', 'MTF-GLP-HPM', 'MTF-GLP-HPM-R', 'MTF-GLP-CBD', 'FE-HPM', 'PRACS','MTF-GLP-HPM-H' 
    };
ratio = 4; % Resize Factor
sensor = 'WV2'; % Sensor
[imageFused,imagesRef,VisibleImage,algorithms] = Pan_sharpening_algorithms(gt,lms,ms,pan,ratio,algorithms,sensor);
%% Inputs:
% ImageFused : true colour fused image (R+G+B)
% imagesRef : true colour reference image (R+G+B)
score = iqa_metrics(imageFused,imagesRef,[],[],IQA,0);
tableData = prepareScoreResult(score,algorithms);