%{
    Demonstration of dimensionality reduction using KPCA.
%}
% clc
% clear all
% close all
% addpath(genpath(pwd))
% 
% load('.\data\helix.mat', 'data')
% kernel = Kernel('type', 'gaussian', 'gamma', 2);
% parameter = struct('numComponents', 2, ...
%                    'kernelFunc', kernel);
% % build a KPCA object
% kpca = KernelPCA(parameter);
% % train KPCA model
% kpca.train(data);
% 
% %　mapping data
% mappingData = kpca.score;
% 
% % Visualization
% kplot = KernelPCAVisualization();
% % visulize the mapping data
% kplot.score(kpca)

% gtab =[0.0040];
% ptab =[0.0010];
% ctab = [100];


   wynik = [fun_svr2(tymczasowe_train,tymczasowe_test,opinieBaza(test),opinieBaza(train),gtab,ctab,ptab)];
   
   kernel = Kernel('type', 'gaussian', 'gamma', 2);
       kernelMatrix = kernel.computeMatrix(tymczasowe_train, tymczasowe_test);  
       
      wynik = [fun_svr2(kernelMatrix,tymczasowe_test,opinieBaza(test),opinieBaza(train),gtab,ctab,ptab)]  
      
%     load('.\data\helix.mat', 'data')



gtab = [0.0001,0.0002,0.0003,0.0004,0.0005,0.0006,0.0007,0.0008,0.0009,0.0010,0.0011,0.0012,0.0013,0.0014,0.0015,0.0016,0.0017,0.0018,0.0019,0.0020,0.0021,0.0022,0.0023,0.0024,0.0025,0.0026,0.0027,0.0028,0.0029,0.0030,0.0031,0.0032,0.0033,0.0034,0.0035,0.0036,0.0037,0.0038,0.0039,0.0040,0.0041,0.0042,0.0043,0.0044,0.0045,0.0046,0.0047,0.0048,0.0049,0.0050,0.0051,0.0052,0.0053,0.0054,0.0055,0.0056,0.0057,0.0058,0.0059,0.0060,0.0061,0.0062,0.0063,0.0064,0.0065,0.0066,0.0067,0.0068,0.0069,0.0070,0.0071,0.0072,0.0073,0.0074,0.0075,0.0076,0.0077,0.0078,0.0079,0.0080,0.0081,0.0082,0.0083,0.0084,0.0085,0.0086,0.0087,0.0088,0.0089,0.0090,0.0091,0.0092,0.0093,0.0094,0.0095,0.0096,0.0097,0.0098,0.0099];
ptab =[0.001,0.008,0.015,0.022,0.029,0.036,0.043,0.050,0.057,0.064,0.071,0.078,0.085,0.092,0.099,0.106,0.113,0.120,0.127,0.134,0.141,0.148,0.155,0.162,0.169,0.176,0.183,0.190,0.197,0.204,0.211,0.218,0.225,0.232,0.239,0.246,0.253,0.260,0.267,0.274,0.281,0.288,0.295,0.302];
ctab = [100,75,50,25,15];
Ctemp = {gtab,ptab,ctab};
Dtemp = Ctemp;
[Dtemp{:}] = ndgrid(Ctemp{:});
parametry = cell2mat(cellfun(@(m)m(:),Dtemp,'uni',0));
workers = 8;
[parlenght,~]=size(parametry);

% gtab =[0.0040];
% ptab =[0.010];
% ctab = [100];

kernel = Kernel('type', 'gaussian', 'gamma', 2);
parameter = struct('numComponents', 75, ...
                   'kernelFunc', kernel);
% build a KPCA object
kpca = KernelPCA(parameter);
% train KPCA model
kpca.train(tymczasowe_train);
%　mapping data
mappingData = kpca.score;


tic
parfor i=1:parlenght
     warning('off','all')
%     if mod(i,1000)==0
%   fprintf('Processing params: %i/%i\n', i,parlenght); 
%     end
wynik(i,:) = [fun_svr2(mappingData,tymczasowe_test,opinieBaza(test),opinieBaza(train),parametry(i,1),parametry(i,3),parametry(i,2)),parametry(i,1),parametry(i,3),parametry(i,2)];
end
toc
% % Visualization
% kplot = KernelPCAVisualization();
% % visulize the mapping data
% kplot.score(kpca)


% 
% % build a KPCA object
% kpca = KernelPCA(parameter);
% % train KPCA model
% kpca.train(tymczasowe_train);
% % test KPCA model
% results = kpca.test(tymczasowe_test);
% 
% % Visualization
% kplot = KernelPCAVisualization();
% kplot.cumContribution(kpca)
% kplot.trainResults(kpca)
% kplot.testResults(kpca, results)




kernel = Kernel('type', 'gaussian', 'gamma', 1/128^2);
parameter = struct('numComponents', 0.65, ...
                   'kernelFunc', kernel);
               
% build a KPCA object
kpca = KernelPCA(parameter);
% train KPCA model
kpca.train(tymczasowe_train);
% test KPCA model
results = kpca.test(tymczasowe_test);
mappingData = kpca.score;
mappingData2 =  results.score;


% Visualization
kplot = KernelPCAVisualization();
kplot.cumContribution(kpca)
kplot.trainResults(kpca)
kplot.testResults(kpca, results)




tic
parfor i=1:parlenght
     warning('off','all')
%     if mod(i,1000)==0
%   fprintf('Processing params: %i/%i\n', i,parlenght); 
%     end
wynik(i,:) = [fun_svr2(mappingData,mappingData2,opinieBaza(test),opinieBaza(train),parametry(i,1),parametry(i,3),parametry(i,2)),parametry(i,1),parametry(i,3),parametry(i,2)];
end
toc





