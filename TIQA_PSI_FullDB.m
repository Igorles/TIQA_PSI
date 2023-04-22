addpath(genpath('Tools'));
load Mos_imgs.mat
IQA = {... Full-Reference methods 18
    'SVD','ERGAS','Q2n','Q','SCC',...
    ...'DISTS', 'HaarPSI', 'IFC', 'MDSI', 'MS-UNIQUE', 'ReSIFT', 'SAM', 'SUMMER', 'VIF', 'SSIM', 'MULTISSIM', 'PerSIM', 'UNIQUE',...
    ... No-Reference methods 13
    'BRISQUE','MLPSIE','NOREQI','SSEQ','SINDEX'
	...'BLINDER', 'CEIQ', 'DIVINE', 'FRIQUEE', 'GWH-GLBP-BIQA', 'NIQE', 'SINQ', 'SINDEX', 'SR-metric'
    };
PC_img = strcat(pwd,filesep,'Database',filesep,'SS',filesep,PC_img);
TC_img = strcat(pwd,filesep,'Database',filesep,'SS',filesep,TC_img);
%Create Svr models for IQA methods, where 0 is the svr model name
Create_Svr_Models(PC_img,TC_img,DMOS_PC_TC,0,IQA)
%% Inputs:
% images : true colour image (R+G+B), imagesRef : true colour reference image (R+G+B)
% images2 : pseudo colour image (NIR+R+G), imagesRef : pseudo colour reference image (NIR+R+G)
images ={strcat(pwd,filesep,'Database\SS\Test\TC_Test_REF_UD_UD.tif');strcat(pwd,filesep,'Database\SS\Test\TC_Test_ATWT-M2_AWGN_Level-1.tif');strcat(pwd,filesep,'Database\SS\Test\TC_Test_ATWT-M2_AWGN_Level-2.tif');strcat(pwd,filesep,'Database\SS\Test\TC_Test_ATWT-M2_AWGN_Level-3.tif')};
imagesRef ={strcat(pwd,filesep,'Database\SS\Test\TC_Test_REF_UD_UD.tif');strcat(pwd,filesep,'Database\SS\Test\TC_Test_REF_UD_UD.tif');strcat(pwd,filesep,'Database\SS\Test\TC_Test_REF_UD_UD.tif');strcat(pwd,filesep,'Database\SS\Test\TC_Test_REF_UD_UD.tif')};
images2 ={strcat(pwd,filesep,'Database\SS\Test\PC_Test_REF_UD_UD.tif');strcat(pwd,filesep,'Database\SS\Test\PC_Test_ATWT-M2_AWGN_Level-1.tif');strcat(pwd,filesep,'Database\SS\Test\PC_Test_ATWT-M2_AWGN_Level-2.tif');strcat(pwd,filesep,'Database\SS\Test\PC_Test_ATWT-M2_AWGN_Level-3.tif')};
imagesRef2 ={strcat(pwd,filesep,'Database\SS\Test\PC_Test_REF_UD_UD.tif');strcat(pwd,filesep,'Database\SS\Test\PC_Test_REF_UD_UD.tif');strcat(pwd,filesep,'Database\SS\Test\PC_Test_REF_UD_UD.tif');strcat(pwd,filesep,'Database\SS\Test\PC_Test_REF_UD_UD.tif')};
%% USAGE
% If you only have true colour image iqa_metrics(images,[],[],[],IQA,0), where 0 is the svr model name
% If you have true colour and reference images iqa_metrics(images,imagesRef,[],[],IQA,0)
% If you have true colour and pseudo colour images iqa_metrics(images,[],images2,[],IQA,0)
% If you have true colour and pseudo colour images and reference images iqa_metrics(images,imagesRef,images2,imagesRef2,IQA,0)
score = iqa_metrics(images,imagesRef,images2,imagesRef2,IQA,0);
tableData = prepareScoreResult(score,[]);