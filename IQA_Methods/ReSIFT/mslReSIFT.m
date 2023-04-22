  function [outCT] =mslReSIFT(img1, img2)
        % Low-pass filtering
        img1 = imfilter(img1, fspecial('gaussian', 4, 5), 'symmetric', 'conv');
        img2 = imfilter(img2, fspecial('gaussian', 4, 5), 'symmetric', 'conv');
        % RGB to Lab color domain transformation
        cform = makecform('srgb2lab');
        img1 = applycform(img1,cform);
        img2 = applycform(img2,cform);
        gray_1 = double(img1(:,:,1)); 
        gray_2 = double(img2(:,:,1)); 
        % Definition of local normalization routine
         funNorm=@(block_struct) (block_struct.data-mean2(block_struct.data))/...
(std(reshape(block_struct.data,[numel(block_struct.data) 1]))+0.001);
        % Local normalization block size
        blockSize=[20 20];
        % Local normalization
        gray_1_norm=abs(blockproc(gray_1,blockSize,funNorm));
        gray_2_norm=abs(blockproc(gray_2,blockSize,funNorm)); 
        % Spectral residual
        [sr_hf_1,~]=SR(gray_1_norm);
        [sr_hf_2,~]=SR(gray_2_norm);
        % Global normalization
        sr_hf_1=sr_hf_1/max(sr_hf_1(:));
        sr_hf_2=sr_hf_2/max(sr_hf_2(:));
        % Multiplicative fusion
        gray_1 = single(gray_1_norm.*(sr_hf_1)) ;
        gray_2 = single(gray_2_norm.*(sr_hf_2)) ; 
        % SIFT descriptor extraction 
        [~, d_1]=vl_sift(gray_1);
        [~, d_2]=vl_sift(gray_2);
        % SIFT descriptor matching
        [~, scores] = vl_ubcmatch(d_1, d_2,1.4) ;
        % Percentile pooling
        l_dist=abs(prctile(scores,5));    
        % Non-linear mapping
        outCT=(1)/((l_dist)/(100000)+0.01);        
  end

    