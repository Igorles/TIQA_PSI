function save_h5_mlpsie(data,Flag)
% tic
for i=1:16

h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/coefficient'),size(data.TrainedKpca{1}{i}.coefficient),'Datatype','single')
h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/data'),size(data.TrainedKpca{1}{i}.data),'Datatype','single')
h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/numSamples'),size(data.TrainedKpca{1}{i}.numSamples),'Datatype','single')
h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/temporary.K'),size(data.TrainedKpca{1}{i}.temporary.K),'Datatype','single')
h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/temporary.K_c'),size(data.TrainedKpca{1}{i}.temporary.K_c),'Datatype','single')
h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/temporary.unit'),size(data.TrainedKpca{1}{i}.temporary.unit),'Datatype','double')
h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/numComponents'),size(data.TrainedKpca{1}{i}.numComponents),'Datatype','single')
h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/featuresTrain'),size(data.TrainedKpca{1}{i}.featuresTrain),'Datatype','single')
h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/maxyO'),size(data.TrainedKpca{1}{i}.maxyO),'Datatype','single')
h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/minyO'),size(data.TrainedKpca{1}{i}.minyO),'Datatype','single')

end

for i=1:20

h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/coefficient'),size(data.TrainedKpca{2}{i}.coefficient),'Datatype','single')
h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/data'),size(data.TrainedKpca{2}{i}.data),'Datatype','single')
h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/numSamples'),size(data.TrainedKpca{2}{i}.numSamples),'Datatype','single')
h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/temporary.K'),size(data.TrainedKpca{2}{i}.temporary.K),'Datatype','single')
h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/temporary.K_c'),size(data.TrainedKpca{2}{i}.temporary.K_c),'Datatype','single')
h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/temporary.unit'),size(data.TrainedKpca{2}{i}.temporary.unit),'Datatype','double')
h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/numComponents'),size(data.TrainedKpca{2}{i}.numComponents),'Datatype','single')
h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/featuresTrain'),size(data.TrainedKpca{2}{i}.featuresTrain),'Datatype','single')
h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/maxyO'),size(data.TrainedKpca{2}{i}.maxyO),'Datatype','single')
h5create(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/minyO'),size(data.TrainedKpca{2}{i}.minyO),'Datatype','single')

end

for i=1:16

h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/coefficient'),data.TrainedKpca{1}{i}.coefficient)
h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/data'),data.TrainedKpca{1}{i}.data)
h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/numSamples'),data.TrainedKpca{1}{i}.numSamples)
h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/temporary.K'),data.TrainedKpca{1}{i}.temporary.K)
h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/temporary.K_c'),data.TrainedKpca{1}{i}.temporary.K_c)
h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/temporary.unit'),data.TrainedKpca{1}{i}.temporary.unit)
h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/numComponents'),data.TrainedKpca{1}{i}.numComponents)
h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/featuresTrain'),data.TrainedKpca{1}{i}.featuresTrain)
h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/maxyO'),data.TrainedKpca{1}{i}.maxyO)
h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/1/',num2str(i),'/minyO'),data.TrainedKpca{1}{i}.minyO)

end

for i=1:20

h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/coefficient'),data.TrainedKpca{2}{i}.coefficient)
h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/data'),data.TrainedKpca{2}{i}.data)
h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/numSamples'),data.TrainedKpca{2}{i}.numSamples)
h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/temporary.K'),data.TrainedKpca{2}{i}.temporary.K)
h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/temporary.K_c'),data.TrainedKpca{2}{i}.temporary.K_c)
h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/temporary.unit'),data.TrainedKpca{2}{i}.temporary.unit)
h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/numComponents'),data.TrainedKpca{2}{i}.numComponents)
h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/featuresTrain'),data.TrainedKpca{2}{i}.featuresTrain)
h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/maxyO'),data.TrainedKpca{2}{i}.maxyO)
h5write(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.h5')),strcat('/data/TrainedKpca/2/',num2str(i),'/minyO'),data.TrainedKpca{2}{i}.minyO)

end
% Elapsed time is 28.710478 seconds.
% Elapsed time is 67.696619 seconds.
% Elapsed time is 539.167819 seconds.

data2.ConstantsNetVgg19 = data.ConstantsNetVgg19 ;
data2.ConstantsNetResnet18 = data.ConstantsNetResnet18;
data2.DMOS_PC_TC = data.DMOS_PC_TC;
save(strcat(pwd,filesep,'IQA_Methods',filesep,'MLPSIE',filesep',strcat('mlpsie_file_1_',num2str(Flag),'.mat')),'data2') 
% toc



