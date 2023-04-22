


 %No-Reference Image Quality Assessment Using Image Statistics and Robust Feature Descriptors
 %%%------------------
% MIT License

% Copyright (c) 2022 

% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:

% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.

% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.


function f= NOREQI(Image )		 			
 
   
  
	Scales=2; 
   f=[];
 
		
  for oneScale = 1:Scales
  
       y=[];
	   f1=0;   
	   I1=Image;	 
	   H1 = fspecial('prewitt') ;	
	   
		  
		H2=H1';  
	    I1=imfilter(I1,H1,'replicate'); 
	    I1=imfilter(I1,H2,'replicate');   
	    I1=imfilter(I1,H1,'replicate'); 
	    I1=imfilter(I1,H2,'replicate');  
	  
	 
		points1 = detectSURFFeatures(I1 , 'MetricThreshold' ,.5);	
	   [f5, vpts2] = extractFeatures((I1), points1, 'SURFSize',64);	   
	    points2 = detectSURFFeatures(Image , 'MetricThreshold' ,.5);	 
	   [f7, vpts4] = extractFeatures((Image), points2, 'SURFSize',64); 
	   
	   		  
	    imm=double(Image);
	   
		y=[y, mean2(imm)];
		y=[y, skewness(imm(:))];
		y=[y, ( kurtosis(imm(:) ) -3)];
		  y=[y, msc(imm)];
		y=[y,std2(imm)];
		y=[y,entropy(imm)];
	   
		I1=double(I1);          
		y=[y, mean2(I1)];
		y=[y, skewness(I1(:))];
		y=[y, (kurtosis(I1(:))  -3)];
		  y=[y, msc(I1)];
		y=[y,std2(I1)];
		y=[y,entropy(I1)];
	   
		y=[y, mean2(f5)]; 
		y=[y, skewness(f5(:))];
		y=[y, (kurtosis(f5(:))   -3)];
		 y=[y, msc1k(f5)]; 
		y=[y,std2(f5)];				
		y=[y,entropy(double(f5))];	   
		
		
		y=[y, mean2(f7)];  
		y=[y, skewness(f7(:))];
		y=[y, (kurtosis(f7(:))   -3)];
		 y=[y, msc1k(f7)]; 
		y=[y,std2(f7)];				
		y=[y,entropy(double(f7))];
		
	
		
		
		f=[f,y];
	  

	  Image=imresize(Image,0.5);
	 
	    
      end %scales
	   


	function z = msc(img) 
p = hist(img(:),0:255);
p = p/sum(p(:));
p_std = sum((p-mean(p)).^2);
z = p_std/length(p_std);	

	function z = msc1k(img)  
p = hist(img(:),-1:.0078:1); 
p = p/sum(p(:));
p_std = sum((p-mean(p)).^2);
z = p_std/length(p_std);	

 
 