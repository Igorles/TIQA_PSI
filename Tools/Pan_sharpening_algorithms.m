function [DirectoryImageFused,DirectoryImagesRef,VisibleImage,algorithms2] = Pan_sharpening_algorithms(I_GT,I_MS,I_MS_LR,I_PAN,ratio,algorithms,sensor)
rmpath(genpath('Tools'));
addpath(genpath(strcat(pwd,'/Pan-sharpening_Methods')));
directory = strcat(strcat(pwd,'/Database/Fused_Images/'));
i = 0;

name = {};

location1                = [50 70 10 30];  
location2                = [100 145 30 60]; 

if ismember('REF',algorithms)

    i=i+1;
    ImageFused(:,:,:,i) = I_GT;
    name = [name,'REF'];

end

if ismember('EXP',algorithms)

    i=i+1;
    ImageFused(:,:,:,i) = I_MS;
    name = [name,'EXP'];

end

if ismember('AWLP',algorithms)

    i=i+1;
    ImageFused(:,:,:,i) = AWLP(I_MS,I_PAN,ratio);
    name = [name,'AWLP'];

end

if ismember('BDSD',algorithms)

    i=i+1;
    ImageFused(:,:,:,i) = BDSD(I_MS,I_PAN,ratio,size(I_MS,1),sensor);
    name = [name,'BDSD'];

end

if ismember('C-BDSD',algorithms)

    numclusters = 30; % number of clusters
    i=i+1;
    ImageFused(:,:,:,i) = C_BDSD(I_MS,I_PAN,ratio,sensor,numclusters);
    name = [name,'C-BDSD'];

end

if ismember('BDSD_PC',algorithms)

    i=i+1;
    ImageFused(:,:,:,i) = BDSD_PC(I_MS,I_PAN,ratio,sensor);
    name = [name,'BDSD_PC'];

end

if ismember('BT-H',algorithms)

    i=i+1;
    ImageFused(:,:,:,i) = BroveyRegHazeMin(I_MS,I_PAN,ratio);
    name = [name,'BT-H'];

end

if ismember('C-GSA',algorithms)

    i=i+1;
    n_segm = 5;
    PS_algorithm = 'GSA';
    ImageFused(:,:,:,i) = GS_Segm(I_MS,I_PAN,gen_LP_image(PS_algorithm,I_MS,I_PAN,I_MS_LR,ratio,sensor), k_means_clustering(I_MS,n_segm));
    name = [name,'C-GSA'];

end

if ismember('SR-D',algorithms)

    i=i+1;
    TS = 7; % Tiling (dimensions of the patches are TS x TS)
    ol = 4; % Overlap (in pixels) between contiguous tile
    n_atoms = 10; % Max number of representation atoms (default value = 10)
    ImageFused(:,:,:,i) = CS(I_MS,I_PAN,I_MS_LR,ratio,sensor,TS,ol,n_atoms);
    name = [name,'SR-D'];

end

if ismember('MTF-GLP',algorithms)

    i=i+1;
    ImageFused(:,:,:,i) = MTF_GLP(I_MS,I_PAN,sensor,ratio);
    name = [name,'MTF-GLP'];

end

if ismember('MTF-GLP-FS',algorithms)

    i=i+1;
    ImageFused(:,:,:,i) = MTF_GLP_FS(I_MS,I_PAN,sensor,ratio);
    name = [name,'MTF-GLP-FS'];

end

if ismember('MTF-GLP-HPM',algorithms)

    i=i+1;
    ImageFused(:,:,:,i) = MTF_GLP_HPM(I_MS,I_PAN,sensor,ratio);
    name = [name,'MTF-GLP-HPM'];

end

if ismember('MTF-GLP-HPM-H',algorithms)

    i=i+1;
    ImageFused(:,:,:,i) = MTF_GLP_HPM_Haze_min(I_MS,I_PAN,sensor,ratio,1);
    name = [name,'MTF-GLP-HPM-H'];

end

if ismember('MTF-GLP-HPM-R',algorithms)

    i=i+1;
    ImageFused(:,:,:,i) = MTF_GLP_HPM_R(I_MS,I_PAN,sensor,ratio);
    name = [name,'MTF-GLP-HPM-R'];

end

if ismember('MTF-GLP-CBD',algorithms)

    i=i+1;
    ImageFused(:,:,:,i) = GS2_GLP(I_MS,I_PAN,ratio,sensor);
    name = [name,'MTF-GLP-CBD'];

end

if ismember('FE-HPM',algorithms)

    i=i+1;
    tap = 25; % dimension of the support (at least 3*ratio)
    num_iter_max = 5; % max number of iteration (at least 3; not sensitive)
    lambda = 10^5; % coefficient to weight the regularization term
    mu = 10^5; % coefficient to weight the regularization term
    threshold = 10^(-3); % threshold on the kernel (it cuts to 0 values below threshold)

    ImageFused(:,:,:,i) = FE_HPM(I_MS,I_PAN,ratio,max(tap,3*ratio),lambda,mu,threshold,max(num_iter_max,3),'Basic');
    name = [name,'FE-HPM'];
    
end

if ismember('MF',algorithms)

    i=i+1;
    ImageFused(:,:,:,i) = MF_HG_Pansharpen(I_MS,I_PAN,ratio);
    name = [name,'MF'];

end

if ismember('PRACS',algorithms)

    i=i+1;
    ImageFused(:,:,:,i) = PRACS(I_MS,I_PAN,ratio);
    name = [name,'PRACS'];

end

for i=1:size(ImageFused,4)

    if size(ImageFused,3) == 4
        VisibleImage(:,:,:,i) = showImage4LR(ImageFused(:,:,:,i),0,1,0,0,0,0,ratio);
        VisibleImage2(:,:,:,i) = showImage4_zoomin(ImageFused(:,:,:,i),0,1,0,0,0,0, location1, location2);
        imwrite(VisibleImage(:,:,:,i),strcat(directory,name{i},'.tif'));
        DirectoryImagesRef(:,:,:,i) = showImage4LR(ImageFused(:,:,:,1),0,1,0,0,0,0,ratio);
    else
        VisibleImage(:,:,:,i) = showImage8LR(ImageFused(:,:,:,i),0,1,0,0,0,0,ratio);
        VisibleImage2(:,:,:,i) = showImage8_zoomin(ImageFused(:,:,:,i),0,1,0,0,0,0, location1, location2);
        imwrite(VisibleImage(:,:,:,i),strcat(directory,name{i},'.tif'));
        DirectoryImagesRef(:,:,:,i) = showImage8LR(ImageFused(:,:,:,1),0,1,0,0,0,0,ratio);
    end

end

DirectoryImageFused = VisibleImage;

if rem(size(name,2),4) == 0
    val = fix(size(name,2)/4);
else
    val = fix(size(name,2)/4)+1;
end
 
fig = figure();
fig.WindowState = 'maximized';
tlo = tiledlayout(fig,val,4,'TileSpacing','Loose');
for j = 1:i
    ax = nexttile(tlo);
    imshow(VisibleImage2(:,:,:,j),'Parent',ax)
    title(name{j})
end

algorithms2 = name;
addpath(genpath('Tools'));