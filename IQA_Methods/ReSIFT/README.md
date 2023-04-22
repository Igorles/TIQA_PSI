# ReSIFT
Code for paper - D. Temel and G. AlRegib, "ReSIFT: Reliability-weighted sift-based image quality assessment," 2016 IEEE International Conference on Image Processing (ICIP), Phoenix, AZ, 2016, pp. 2047-2051.

<p align="center">
  <img src=/Images/sift_lit.PNG/>
</p> 

### Paper
ArXiv: https://arxiv.org/abs/1811.06090

IEEE: https://ieeexplore.ieee.org/document/7532718

This is a brief explanation and demonstration of the proposed image quality assessment algorithm ReSIFT. Given an original and a distorted image, ReSIFT outputs a score that approximates the perceptual quality of the distorted image.



### Citation
If you find our paper and repository useful, please consider citing our paper:  
```
@INPROCEEDINGS{7532718, 
author={D. {Temel} and G. {AlRegib}}, 
booktitle={2016 IEEE International Conference on Image Processing (ICIP)}, 
title={ReSIFT: Reliability-weighted sift-based image quality assessment}, 
year={2016}, 
pages={2047-2051}, 
doi={10.1109/ICIP.2016.7532718}, 
ISSN={2381-8549}, 
month={Sep.},}

```
### Code
* mslReSIFT: propsed method that takes compared images as input and ouputs the estiamted quality score ReSIFT
* Required packed: vlfeat is required for SIFT feature extraction and mathcing. Download and compile from http://www.vlfeat.org/overview/sift.html.


### Abstract 
This paper presents a full-reference image quality estimator based on SIFT descriptor matching over reliability-weighted feature maps. Reliability assignment includes a smoothing operation, a transformation to perceptual color domain, a local normalization stage, and a spectral residual computation with global normalization. The proposed method ReSIFT is tested on the LIVE and the LIVE Multiply Distorted databases and compared with 11 state-of-the-art full-reference quality estimators. In terms of the Pearson and the Spearman correlation, ReSIFT is the best performing quality estimator in the overall databases. Moreover, ReSIFT is the best performing quality estimator in at least one distortion group in compression, noise, and blur category.

### Keywords
perceptual image quality assessment, scale invariant feature transform (SIFT), spectral residual, reliable descriptor matching


### Contact:

Ghassan AlRegib:  alregib@gatech.edu, https://ghassanalregib.com/, 

Dogancan Temel: dcantemel@gmail.com, http://cantemel.com/


