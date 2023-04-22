
function  ob=normVec(objt,maxV,minV)

ob=[];

for i=1:size(objt,2)
	ob=[ob,(objt(:,i)-minV(:,i))/(maxV(:,i)-minV(:,i))];
end  