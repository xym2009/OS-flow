clear;close all;clc;

im1_path='P3_1.tif';
im2_path='P3_2.tif';

im1=imread(im1_path);
im2=imread(im2_path);
if size(im1,3)>1
    im1=im1(:,:,1);
else if size(im1,3)==3
        im1=rgb2gray(im1);
    end
end
if size(im2,3)>1
    im2=im2(:,:,1);
else if size(im2,3)==3
        im2=rgb2gray(im2);
    end
end

im1=im2double(im1);
im2=im2double(im2);
im1=im1+0.001;
im2=im2+0.001;
%figure;imshow(im1);figure;imshow(im2);

cellsize=3;
gridspacing=1;
IsReversal = 1;
%%
tic
sift1 = mexDenseOS(im1,cellsize,gridspacing,0,IsReversal);  %opt
sift2 = mexDenseOS(im2,cellsize,gridspacing,1,IsReversal);  %sar
sift1=sift1(:,:,8:8:end);
sift2=sift2(:,:,8:8:end);
%%
para=255;
SIFTflowpara.alpha=2*para;
SIFTflowpara.d=40*para;
SIFTflowpara.gamma=0.005*para;
SIFTflowpara.nlevels=7;
SIFTflowpara.wsize=2;
SIFTflowpara.topwsize=10;
SIFTflowpara.nTopIterations = 60;
SIFTflowpara.nIterations= 30;
SIFTflowpara.median= true;

% [vx2,vy1,energylist]=SIFTflowc2f(sift1,sift2,SIFTflowpara,im1,im2);toc
[vx1,vy1,energylist]=SIFTflowc2f(sift2,sift1,SIFTflowpara,im2,im1);toc
%%

% warpI2=warpImage(im2,vx2,vy2);
warpI1=warpImage(im1,vx1,vy1);
solution = [1,0,0;0,1,0;0,0,1];
% image_fusion(warpI2,im1,solution);
image_fusion(warpI1,im2,solution);

