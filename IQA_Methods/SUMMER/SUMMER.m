function outCT=SUMMER(im1,im2)
%%
%  Author:              Dogancan Temel
%  PI:                  Ghassan AlRegib
%  Version:             1.0
%  Date:                August 8, 2018
%  Submitted to:        Elsevier Signal Processing: Image Communication 
%%
%  Input:               Reference and distorted images (color)
%                       im1: reference image
%                       im2: distorted image
%  Output:              SUMMER score
outCT=0;
            for c=1:3      
                inp = double(im1(:,:,c))/255- double(im2(:,:,c))/255;
                for j = 1:4
                    inpR = imresize(inp, 1/2^j,'box');
                    out=mean2(abs(log(1+abs(fft2(abs(inpR)))))) ;
                    outCT = outCT + out;
                end
            end          
            for c=1:3
                for j=3:4
                    x1 = abs(fft2(imresize(double(im1(:,:,c))/255, 1/2^(j),'bilinear')));
                    x2 = abs(fft2(imresize(double(im2(:,:,c))/255, 1/2^(j),'bilinear')));
                    outCT = outCT*log(1+mean2(x1./x2)) ;

                end
            end
            outCT=5*nthroot(1./(outCT+1),3);
end