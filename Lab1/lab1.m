Image = imread('book-cover.tif');
max(max(Image))

Image2 = Image/16;
max(max(Image2))

Image3 = Image2 * 16;
imshow(Image3)
title("Image 3")
figure
imshow(Image)

imwrite(Image3, "Image3.png");
A = uint8(0:255);
B = (A/16)*16;
max(B);
%%
clear
Image = imread('book-cover.tif');
Image = im2double(Image);
Image2 = Image/16;
Image3 = Image2 * 16;
imshow(Image3)
title("Image 3 double")
figure
imshow(Image)
%%
clear
Image = imread('einstein-low-contrast.tif');
Image = im2double(Image);
K = 1;
minIm = min(min(Image));
maxIm = max(max(Image));
ImContr = K * ((Image - minIm) / (maxIm - minIm));
imshow(Image); title("Original")
% figure
% imshow(ImContr)
%% Task 3
clear
live = imread("angiography-live-image.tif");
mask = imread("angiography-mask-image.tif");
live = im2double(live);
mask = im2double(mask);

diff = live - mask;
dmin = min(min(diff));
dmax = max(max(diff));
imshow(diff)
K = 1;
diffContr = K * (diff - dmin)/(dmax - dmin);
imshow(diffContr)
%% Task 4
clear
Image = imread("pollen-lowcontrast.tif");
Image = im2double(Image);

imhist(Image)
histeq(Image)

%% Task 5
clear
Image = imread("Shade_pattern.tif");
Image = im2double(Image);

shading = im2double(imread("Shade_estimate.tif"));

res = Image./shading;

BW = imbinarize(res, 0.5);
imshow(BW)

(1024*1024)/1048576
%% Task 6
clear
I = zeros(400,600,3);
I(100:200,:,1) = 1;
I(:,200:400,2) = 1;
I(150:350,300:500,3) = 1;

flag = zeros(400,600,3);
flag(100:200,:,1:2) = 1;
flag(:,100:200,1:2) = 1;

flag(1:100,1:100,3) = 1;
flag(200:400,1:100,3) = 1;

flag(1:100,200:600,3) = 1;
flag(200:400,200:600,3) = 1;

imshow(flag)
%% Gamma Correction 
clear
Image = imread('aerialview-washedout.tif');
AV = GammaCorrection(Image, 2.5, 0.01, 0.98);

imshow(AV)

Image = imread('spillway-dark.tif');
SP = GammaCorrection(Image, 0.4, 0.1, 0.97);
figure

imshow(SP)
%%
clear

im = im2double(imread("RGBflower.tif"));
LevelSlicing(im,im2double(imread("IRflower.tif")), 0.1);





