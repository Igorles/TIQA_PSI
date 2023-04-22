% TIQA-PSI: Toolbox for Perceptual Image Quality Assessment of Pan-Sharpened Images
% Author:
% Igor Stępień, Mariusz Oszust

## Installation
Requires:
Image Processing Toolbox
Statistics and Machine Learning Toolbox
Deep Learning Toolbox
curve fitting toolbox
Computer Vision Toolbox
Parallel Computing Toolbox
Signal Processing Toolbox
the Deep Learning Toolbox Model for VGG-16
the Deep Learning Toolbox Model for VGG-19
the Deep Learning Toolbox Model for ResNet-18

## Run on Matlab
Usage: 

First functionality:
If you want train models on the entire image database,
and test exemplary images use:
TIQA_PSI_FullDB.m

If you want to assess your own images
In line 17: you can put the directory of the RGB image file  
In line 18: you can put the directory of the RGB reference image file  
In line 19: you can put the directory of the pseudo colour image file  
In line 20: you can put the directory of the pseudo colour reference image file  

Second functionality:
If you want train 10 models on the 80% of images from the database,
and test on 20% images use:
TIQA_PSI_Train.m

Third functionality:
IF you want to create Pan-sharpened images load Pan and MS images.
They will be automatically processed  by selected set of PS algorithms.
All generated PS images are evaluated by IQA technique.
TIQA_PSI_Pan.m


MIT License
Copyright (c) 2023 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.








