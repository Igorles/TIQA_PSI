function [ saliencyMap1,saliencyMap2 ] = SR( image )
        scale = 0.25; %fixed
        aveKernelSize = 3; %fixed
        gauSigma = 3.8; %fixed
        gauSize = 10; %fixed
        inImg = imresize(image, scale);

        %%%% Spectral Residual
        myFFT = fft2(inImg);
        myLogAmplitude = log(abs(myFFT));
        myPhase = angle(myFFT);
        
        myLF=imfilter(myLogAmplitude, fspecial('average', aveKernelSize), 'replicate');

        mySpectralResidual = myLogAmplitude - myLF;
        
        saliencyMap1 = abs(ifft2(exp(mySpectralResidual + 1i*myPhase))).^2;
        saliencyMap2 = abs(ifft2(exp(myLF + 1i*myPhase))).^2;

        %%%% After Effect
        saliencyMap1 = mat2gray(imfilter(saliencyMap1, fspecial('gaussian', [gauSize, gauSize], gauSigma)));
        saliencyMap1 = imresize(saliencyMap1,[size(image,1) size(image,2)]); 
        
        saliencyMap2 = mat2gray(imfilter(saliencyMap2, fspecial('gaussian', [gauSize, gauSize], gauSigma)));
        saliencyMap2 = imresize(saliencyMap2,[size(image,1) size(image,2)]); 

end

