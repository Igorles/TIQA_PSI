function q = divine_overall_quality(r)

% Function to compute overall quality given feature vector 'r'

load data_live_trained.mat

%% Classification
atrain = repmat(a_class,[size(r,1) 1]);btrain = repmat(b_class,[size(r,1) 1]);
x_curr = atrain.*r+btrain;

[pred_class acc p] = svmpredict2(1,x_curr,model_class,'-b 1');
% [pred_class acc p] = system(['echo ' svmpredict2(1,x_curr,model_class,'-b 1')  '>> out.txt']);
% 
% system('svmpredict2  -b 1 1 x_curr model_class >> out.txt');
% 
% system('svm-scale2 -l 0 -u 1 -r range2 test_ind2.txt >> test_ind_scaled2');


%% Regression
for i = 1:5
    atrain = repmat(a_reg(i,:),[size(r,1) 1]);btrain = repmat(b_reg(i,:),[size(r,1) 1]);
    x_curr = atrain.*r+btrain;
    [q(i) reg_acc(i,:) ~] = svmpredict2(1,x_curr,model_reg{i});
end
%% Final Score
q = sum(p.*q);
% [predict_score, ~, ~] = svmpredict(1,tym, model_CORNIA_TC,'-q');