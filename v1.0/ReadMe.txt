OS-Flow is a pixel-wise coregistration algorithm designed for optical-to-SAR images.

We hope this code will be helpful, and we are interested in getting back your remarks. 

Please use this code only for research purpose!

## Citations for OS-Flow algorithm :

If you are using OS-Flow in your project, we kindly ask you to cite :

Y.Xiang, F.Wang, L.Wan, N.Jiao, H. You, "OS-flow: A Robust Algorithm for Dense Optical and SAR Image Registration," in IEEE Transactions on Geoscience and Remote Sensing, vol. 57, no. 9, pp. 6335-6354, 2019.

## help

The code is provided here in matlab, mex with C++. We tested the code in Matlab R2018b with MinGw64 (win10) .

OS.m is the main function, im1 is the optical image and im2 is the SAR image, we provide P3_1.tif and P3_2.tif as an example pair. 

The most important parameter is the SIFTflowpara.nlevels, we suggest 6 or 7 for images with size of 1500x1500.

By now, our code is not suitable for images large than 4000x4000. (Maybe it is caused by the limitation of memory, not sure.) 