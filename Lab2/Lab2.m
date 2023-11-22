% Problem 1
Image = im2double(imread("TestPattern.tif"));
Kernel = (1/81) * ones(9,9);

P1 = conv2(Image, Kernel);
imwrite(P1, "P1.tif");

%Problem 2
Kernel = (1/(21*21)) * ones(21,21);
P2 = conv2(Image, Kernel);
imwrite(P2, "P2.tif")

% Problem 5
Image3 = imfilter(Image, Kernel, "replicate");
imwrite(Image3, "Image3.tif")

% Problem 6
impulse = zeros(21,21);
impulse(11,11) = 1;
Kernel = impulse - Kernel;
Image4 = imfilter(Image, Kernel, "replicate");
imwrite(Image4, "Image4.tif")

% Problem 7
Image5 = Image4 + Image;
imwrite(Image5, "Image5.tif")

% Problem 9
sobx = [-1 0 1; -2 0 2; -1 0 1];
Image6 = imfilter(Image, sobx);
imwrite(Image6, "Image6.tif")

% Problem 10
soby = [-1 -2 -1; 0 0 0; 1 2 1];
Image7 = imfilter(Image, soby);
imwrite(Image7, "Image7.tif");

%Problem 11
Image8 = sqrt(Image6.^2 + Image7.^2);
%Image8  = (Image8 - min2(Image8(:)))/(max2(Image8) - min2(Image8));
imwrite(Image8, "Image8.tif");
%% Spatial Filtering 
clear
Gaussian_low = fspecial('gaussian', 5,1);
Gaussian = fspecial('gaussian', 3, 1);
Kernel3 = (1/81) * ones(9,9);
Kernel2 = (1/(81*81)) * ones(81,81);
Kernel = (1/(21*21)) * ones(21,21);
Image = imread("zoneplate.tif");

[olp, ohp, obr, obp, oum, ohb] = myfilter(Image, Kernel, Kernel2);
imshow(Image)
figure
imshow(oum)
figure
imshow(ohb)

%% Eliminate Objects

imshow(eliminateobjects(im2double(imread("test4.tif")), 4))




