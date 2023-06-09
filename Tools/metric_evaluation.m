 

function eval = metric_evaluation(subjective,objective)


try
 

	spearman= (corr(objective, subjective, 'type', 'spearman'));
	kendall= (corr(objective, subjective, 'type', 'kendall'));
	
    %values for beta as in VSI implementation, feel free to change them. 
	beta(1) = 10;
	beta(2) = 0;
	beta(3) = mean(objective);
	beta(4) = 1;
	beta(5) = 0.1;

	[bayta ehat,J] = nlinfit(objective,subjective,@logistic,beta);
	
	 
	[ypre junk] = nlpredci(@logistic,objective,bayta,ehat,J);
	%eres=abs(ypre-subjective)
	
% 	RMSE = (sqrt(sum((ypre - subjective).^2) / length(subjective)));
	pearson = (corr(subjective, ypre, 'type','Pearson')) ;

	
catch %just in case
	spearman=0;
	kendall=0;    
	pearson=0;    
% 	RMSE=0;    
end
eval=[spearman,kendall,pearson ];
