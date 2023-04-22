function data = load_h5_mlpsie(Flag)
% tic
load(strcat('mlpsie_file_1_',num2str(Flag),'.mat'),'data2');
% load('mlpsie_file_1.mat','data2'); 
data = data2;
for i=1:16

data.TrainedKpca{1}{i}.coefficient = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/1/',num2str(i),'/coefficient'));
data.TrainedKpca{1}{i}.data = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/1/',num2str(i),'/data'));
data.TrainedKpca{1}{i}.numSamples = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/1/',num2str(i),'/numSamples'));
data.TrainedKpca{1}{i}.temporary.K = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/1/',num2str(i),'/temporary.K'));
data.TrainedKpca{1}{i}.temporary.K_c = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/1/',num2str(i),'/temporary.K_c'));
data.TrainedKpca{1}{i}.temporary.unit = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/1/',num2str(i),'/temporary.unit'));
data.TrainedKpca{1}{i}.numComponents = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/1/',num2str(i),'/numComponents'));
data.TrainedKpca{1}{i}.featuresTrain = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/1/',num2str(i),'/featuresTrain'));
data.TrainedKpca{1}{i}.maxyO = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/1/',num2str(i),'/maxyO'));
data.TrainedKpca{1}{i}.minyO = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/1/',num2str(i),'/minyO'));

end

for i=1:20

data.TrainedKpca{2}{i}.coefficient = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/2/',num2str(i),'/coefficient'));
data.TrainedKpca{2}{i}.data = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/2/',num2str(i),'/data'));
data.TrainedKpca{2}{i}.numSamples = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/2/',num2str(i),'/numSamples'));
data.TrainedKpca{2}{i}.temporary.K = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/2/',num2str(i),'/temporary.K'));
data.TrainedKpca{2}{i}.temporary.K_c = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/2/',num2str(i),'/temporary.K_c'));
data.TrainedKpca{2}{i}.temporary.unit = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/2/',num2str(i),'/temporary.unit'));
data.TrainedKpca{2}{i}.numComponents = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/2/',num2str(i),'/numComponents'));
data.TrainedKpca{2}{i}.featuresTrain = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/2/',num2str(i),'/featuresTrain'));
data.TrainedKpca{2}{i}.maxyO = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/2/',num2str(i),'/maxyO'));
data.TrainedKpca{2}{i}.minyO = h5read(strcat('mlpsie_file_1_',num2str(Flag),'.h5'),strcat('/data/TrainedKpca/2/',num2str(i),'/minyO'));

end
% toc









