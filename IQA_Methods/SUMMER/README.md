# SUMMER
Code for paper - D. Temel and G. AlRegib, “Perceptual Image Quality Assessment through Spectral Analysis of Error Representations ,” Signal Processing: Image Communication, Volume 70, 2019, Pages 37-46.


<p align="center">
  <img src=/Images/graphical_abstract.png/>
</p> 

### Paper
ArXiv: https://arxiv.org/abs/1810.05964

ScienceDirect: https://www.sciencedirect.com/science/article/pii/S0923596518308531 

This is a brief explanation and demonstration of the proposed image quality assessment algorithm algorithm SUMMER. Given an original and a distorted image, SUMMER outputs a score that approximates the perceptual quality of the distorted image.


### Highlights
* SUMMER is an image quality estimator based on spectral analysis of error signals.
* Spectral analysis is performed over multiple scales and color channels.
* Frequency-based weights are extracted to align spectral analysis scores.
* Mean error spectrum increases as visual degradations become more severe.  
* SUMMER significantly outperforms majority of the benchmarked algorithms.



### Citation
If you find our paper and repository useful, please consider citing our paper:  
```
@article{TEMEL201937,
title = "Perceptual image quality assessment through spectral analysis of error representations",
journal = "Signal Processing: Image Communication",
volume = "70",
pages = "37 - 46",
year = "2019",
issn = "0923-5965",
doi = "https://doi.org/10.1016/j.image.2018.09.005",
url = "http://www.sciencedirect.com/science/article/pii/S0923596518308531",
author = "Dogancan Temel and Ghassan AlRegib",
keywords = "Full-reference image quality assessment, Visual system, Error spectrum, Spectral analysis, Color perception, Multi-resolution",
}

```
### Code
SUMMER.m takes reference and distorted images as input and outputs quality score.



### Abstract 
In this paper, we analyze the statistics of error signals to assess the perceived quality of images. Specifically, we focus on the magnitude spectrum of error images obtained from the difference of reference and distorted images. Analyzing spectral statistics over grayscale images partially models interference in spatial harmonic distortion exhibited by the visual system but it overlooks color
information, selective and hierarchical nature of visual system. To overcome these shortcomings, we introduce an image quality assessment algorithm based on the Spectral Understanding of Multi-scale and Multi-channel Error Representations, denoted as SUMMER. We validate the quality assessment performance over 3 databases with around 30 distortion types. These distortion types are grouped into 7 main categories as compression artifact, image noise, color artifact, communication error, blur, global and local distortions. In total, we benchmark the performance of 17 algorithms along with the proposed algorithm using 5 performance metrics that measure linearity, monotonicity, accuracy, and consistency. In addition to experiments with standard performance metrics, we analyze the distribution of objective and subjective scores with histogram difference metrics and scatter plots. Moreover, we analyze the classification performance of quality assessment algorithms along with their statistical significance tests. Based on our experiments, SUMMER significantly outperforms majority of the compared methods in all benchmark categories.

### Keywords
Full-reference image quality assessment, visual system, error spectrum, spectral analysis, color perception, multi-resolution.

### Visualization of Magnitude Spectrum Maps
To understand the structure of magnitude spectrums for individual natural images, we analyzed sample images from the TID 2013 database as shown in the figure. As sample images, we used images of parrots with an out of focus natural scene in the background, a flower with a house in the background, and a sailboat with another sailboat behind in an ocean. As distortion, we included blur, quantization, and
spatially correlated noise with a level of 1 (min), 3 (mid), and 5 (max). We show distorted images in one row and corresponding power spectrums in the following row. On the lower right side, we show the mean opinion scores for the distorted images and the mean values for the normalized magnitude spectrums.

<p align="center">
  <img src=/Images/maps.PNG/>
</p> 

In case of blur degradation, high frequency components are filtered out and images are smoother. As the degradation level increases, additional lower frequency components get filtered out and error becomes more centralized in the spectrum as observed in Figs. (d-f). There is a sharp horizontal line and a vertical line, which correspond to the regular patterns in the images. In the quantization degradation, pixels with similar color and texture characteristics converge to similar values because of the loss of details in the quantization stage. Therefore, the error spectrum is more concentrated as the degradation levels increase as observed in Figs. (j-l). In the noise degradation, pixels are corrupted with a spatially correlated degradation, which leads to local pointy distortions all over the images. Because of the spatial correlation, the magnitude spectrum is more symmetric and continuous as observed in Figs. (p-r).



### Contact:

Ghassan AlRegib:  alregib@gatech.edu, https://ghassanalregib.com/, 

Dogancan Temel: dcantemel@gmail.com, http://cantemel.com/


