%{
    Demonstration of reconstruction using KPCA.
%}
clc
clear all
close all
addpath(genpath(pwd))

load('.\data\circle.mat', 'data')
kernel = Kernel('type', 'gaussian', 'gamma', 0.2);
parameter = struct('numComponents', 2, ...
                   'kernelFunc', kernel);
% build a KPCA object
kpca = KernelPCA(parameter);
% train KPCA model
kpca.train(data);

%　reconstructed data
reconstructedData = kpca.newData;

% Visualization
kplot = KernelPCAVisualization();
kplot.reconstruction(kpca)
