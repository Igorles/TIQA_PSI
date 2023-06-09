rand('seed',0);
addpath(genpath('Tools'));
load Mos_imgs_2.mat
IQA = {... Full-Reference methods 18
    'Q','Q2n','SSIM','ERGAS',...
    ...'DISTS','HaarPSI','IFC','MDSI','MS-UNIQUE',
    ...'ReSIFT','SAM','SCC','SUMMER','SVD','VIF','MULTISSIM','PerSIM','UNIQUE',...	
    ... No-Reference methods 13
    'MLPSIE','SINDEX','DIVINE','BRISQUE'
    ... 'BLINDER','CEIQ','FRIQUEE','GWH-GLBP-BIQA',
    ... 'NIQE','NOREQI','SR-metric','SSEQ'
    };
tiqapsitrainHelper % script preparing the database for the popular 80:20 
result = createTableResult(resultTmp,names) 
createBoxPlot(resultTmp,result)
wilcoxonTable(resultTmp,names)