# MS-UNIQUE
This is a demonstration of the algorithm described in the paper "[MS-UNIQUE: Multi Model and Sharpness Weighted Unsupervised Image Quality Estimation](https://ghassanalregibdotcom.files.wordpress.com/2016/10/prabhushankar2017_ei.pdf)". Given an original and a distorted image, MS-UNIQUE gives out a score  that approximates the perceptual quality of the distorted image.


You can change this program as you like and use it anywhere, but please refer to its original source ([cite](https://ghassanalregibdotcom.files.wordpress.com/2016/10/mohit_ei2017-bib.zip) our [paper](https://ghassanalregibdotcom.files.wordpress.com/2016/10/prabhushankar2017_ei.pdf) and our web page at
https://ghassanalregib.com/unique-unsupervised-image-quality-estimation/).

### Usage :

Run the demo.m file. Sample original and distorted images are provided.
The code outputs the quality of the distorted image which lies between 0 and 1 (1 being the best quality).  

### ABSTRACT  

In this paper, we train independent linear decoder models to estimate the perceived quality of images. More specifically, we calculate the responses of individual non-overlapping image patches to each of the decoders and scale these responses based on the sharpness characteristics of filter set. We use multiple linear decoders to capture different abstraction levels of the image patches. Training each model is carried out on 100,000 image patches from the ImageNet database in an unsupervised fashion. Color space selection and ZCA Whitening are performed over these patches to enhance the descriptiveness of the data. The proposed quality estimator is tested on the LIVE and the TID 2013 image quality assessment databases. Performance of
the proposed method is compared against eleven other state of the art methods in terms of accuracy, consistency, linearity, and monotonic behavior. Based on experimental results, the proposed method is generally among the top performing quality estimators in all categories.

### MS-UNIQUE : Multi-Model and Sharpness Weighted Unsupervised Image Quality Estimation

The learnt filter weights with the corresponding number of hidden units:

<p align="center">
  <img src=/Images/Visualization.png/>
</p>   

Block Diagram for differentiating weights based on color and edges and testing: 

<p align="center">
  <img src=/Images/BlockDiagram.png/>
</p>  


Applying these weights to original (top) and distorted images (bottom), the obtained feature maps from UNIQUE and MS-UNIQUE:  
<p align="center">
  <img src=/Images/FeatMaps.png/>
</p>  

The results of MS-UNIQUE on LIVE, and TID13 databases :  

![Results Filters](/Images/Results.png)  

### Citation

Electronic Imaging Link : https://www.ingentaconnect.com/contentone/ist/ei/2017/00002017/00000012/art00006  
ArXiv Link : https://arxiv.org/abs/1811.08947  
Citation BibTex : https://ghassanalregibdotcom.files.wordpress.com/2016/10/mohit_ei2017-bib.zip  
