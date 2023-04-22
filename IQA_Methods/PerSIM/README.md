# PerSIM
Code for paper - D. Temel and G. AlRegib, "PerSIM: Multi-resolution image quality assessment in the perceptually uniform color domain," 2015 IEEE International Conference on Image Processing (ICIP), Quebec City, QC, 2015, pp. 1682-1686.


<p align="center">
  <img src=/Images/graphical_abstract.png/>
</p> 

### Paper
ArXiv: https://arxiv.org/abs/1811.07417

IEEE: https://ieeexplore.ieee.org/document/7351087

This is a brief explanation and demonstration of the proposed image quality assessment algorithm algorithm PerSIM. Given an original and a distorted image, PerSIM outputs a score that approximates the perceptual quality of the distorted image.



### Citation
If you find our paper and repository useful, please consider citing our paper:  
```
@INPROCEEDINGS{7351087, 
author={D. {Temel} and G. {AlRegib}}, 
booktitle={2015 IEEE International Conference on Image Processing (ICIP)}, 
title={PerSIM: Multi-resolution image quality assessment in the perceptually uniform color domain}, 
year={2015}, 
pages={1682-1686}, 
doi={10.1109/ICIP.2015.7351087}, 
ISSN={}, 
month={Sep.},}

```
### Code
PerSIM.m takes reference and distorted images as input and outputs quality score.



### Abstract 
An average observer perceives the world in color instead of black and white. Moreover, the visual system focuses on structures and segments instead of individual pixels. Based on these observations, we propose a full reference objective image quality metric modeling visual system characteristics and chroma similarity in the perceptually uniform color domain (Lab). Laplacian of Gaussian features are obtained in the L channel to model the retinal ganglion cells in human visual system and color similarity is calculated over the a and b channels. In the proposed perceptual similarity index (PerSIM), a multi-resolution approach is followed to mimic the hierarchical nature of human visual system. LIVE and TID2013 databases are used in the validation and PerSIM outperforms all the compared metrics in the overall databases in terms of ranking, monotonic behavior and linearity.

### Keywords
image quality analysis, human visual system, perception, LoG features, similarity index.


### Contact:

Ghassan AlRegib:  alregib@gatech.edu, https://ghassanalregib.com/, 

Dogancan Temel: dcantemel@gmail.com, http://cantemel.com/


