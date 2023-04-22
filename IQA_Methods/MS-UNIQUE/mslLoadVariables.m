function [weight,bias,Indices] = mslLoadVariables(var)

%% Load workspace
    workspace = load([var,'.mat']);        
    weight = workspace.W;
    bias = workspace.b;
    numFilters = length(bias);
    
%% Separate filters and weigh them according to sharpness
   
    weight_process = weight(:,1:64);
    weight_process = weight_process - (sum(weight_process(:))/length(weight_process(:)));
    weight_process = weight_process./((ones(size(weight_process,1),1))*max(abs(weight_process)));
    
    kurt = kurtosis(weight_process,0,2);
    
    Ind = find((kurt > 5));
    Indices = ones(numFilters,1);
    Indices(Ind(1:length(Ind)),1) = 2;
    
    Ind2 = find((kurt < 2));
    Indices(Ind2(1:length(Ind2)),1) = 0.5;
          
end