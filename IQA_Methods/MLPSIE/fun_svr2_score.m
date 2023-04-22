function [score] = fun_svr2_score(wektor_uczace,wektor_testowe,test,train,par_g,par_c,par_p)
addpath('.\libsvm-3.22\libsvm-3.22\matlab')
randn('seed',0)
rand('seed',0)

learningO=double([wektor_uczace]);
testingO=double([wektor_testowe]);

minyO=min(learningO);  %1) Different features have different ranges. Find them.
maxyO=max(learningO);
learningO =normMe(learningO,maxyO,minyO);  %2) Normalize them to [0 1].
testingO =normMe(testingO,maxyO,minyO);
parametry = strcat("-s 3 -g ",num2str(par_g)," -c ",num2str(par_c)," -p ",num2str(par_p), " -q ");
parametry = convertStringsToChars(parametry);

model = svmtrain(train,learningO,parametry); 

[predict_score, ~, ~] = svmpredict(test,testingO, model ,' -q');
score = predict_score;

end
