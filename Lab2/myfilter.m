function [olp, ohp, obr, obp, oum, ohb]=myfilter(im, lp1, lp2)
%
% function [olp, ohp, obr, obp, oum, ohb]=myfilter(im, lp1, lp2)
%
%% LAB2, TASK2
%
%% Performs filtering
%
% Filters the original grayscale image, im, given two different lowpass filters
% lp1 and lp2 with two different cutoff frequencies.
% The results are six images, that are the result of lowpass, highpass,
% bandreject, bandpass filtering as well as unsharp masking and highboost
% filtering of the original image
%
%% Who has done it
%
% Authors: Gayathri Naranath , gayna875
%          Todel Touma, todto213
% You can work in groups of max 2 students
%
%% Syntax of the function
%
%      Input arguments:
%           im: the original input grayscale image of type double scaled
%               between 0 and 1
%           lp1: a lowpass filter of odd size
%           lp2: another lowpass filter of odd size, with lower cutoff
%                frequency than lp1
%
%      Output arguments:
%            olp: the result of lowpass filtering the input image by lp1
%            ohp: the result of highpass filtering the input image by
%                 the highpass filter constructed from lp1
%            obr: the result of bandreject filtering the input image by
%                 the bandreject filter constructed from lp1 and lp2
%            obp: the result of bandpass filtering the input image by
%                 the bandreject filter constructed from lp1 and lp2
%            oum: the result of unsharp masking the input image using lp2
%            ohb: the result of highboost filtering the input image using
%                 lp2 and k=2.5
%
% You MUST NEVER change the first line
%
%% Basic version control (in case you need more than one attempt)
%
% Version: 2
% Date: 22/11-2023
%
% Gives a history of your submission to Lisam.
% Version and date for this function have to be updated before each
% submission to Lisam (in case you need more than one attempt)
%
%% General rules
%
% 1) Don't change the structure of the template by removing %% lines
%
% 2) Document what you are doing using comments
%
% 3) Before submitting make the code readable by using automatic indentation
%       ctrl-a / ctrl-i
%
% 4) Often you must do something else between the given commands in the
%       template
%
%% Here starts your code.
% Write the appropriate MATLAB commands right after each comment below.
%

%Convert image to double so values are between [0,1]
im = im2double(im);

%% Lowpass filtering
% Lowpass filter the input image by lp1. Use symmetric padding in order to
% avoid the dark borders around the filtered image.
% Perform the lowpass filtering here:
%

% Use replicate padding as in preperations
olp = imfilter(im,lp1, "symmetric");

%% Highpass filtering
% Construct a highpass filter kernel from lp1, call it hp1, here:

% Create impulse matrix
[m,n] = size(lp1);
impulse = zeros(m,n);
impulse(floor(m/2)+1, floor(n/2)+1) = 1;

% Create highpass filter
hp1 = impulse - lp1;

% Filter the input image by hp1, to find the result of highpass filtering
% the input image, here:

ohp = imfilter(im,hp1, "symmetric");

%% Bandreject filtering
% Construct a bandreject filter kernel from lp1 and lp2, call it br1,
% IMPORTANT: lp2 has a lower cut-off frequency than lp1
% here:

% lp2 = lower cutoff frequency, size axb
% hp1 = impulse - lp1, calculated above, size mxn as defined above
% both lp1 & lp2 have odd array sizess

[a,b] = size(lp2);

% Pad smaller array
if(m > a)
    lp2 = padarray(lp2, [abs((m-a)/2), abs((n-b)/2)], 0, "both");
end

if (m < a)
    hp1 = padarray(hp1, [abs((m-a)/2), abs((n-b)/2)], 0, "both");
end

% Från lektion 2 uppg 23c)
br1 = lp2 + hp1;

% Filter the input image by br1, to find the result of bandreject filtering
% the input image, here:

obr = imfilter(im, br1, "symmetric");

%% Bandpass filtering
% Construct a bandpass filter kernel from br1, call it bp1, here:

% Create new impulse matrix
[m,n] = size(br1);
impulse = zeros(m,n);
impulse(floor(m/2)+1, floor(n/2)+1) = 1;

bp1 = impulse - br1;

% Filter the input image by bp1, to find the result of bandpass filtering
% the input image, here:

obp = imfilter(im,bp1, "symmetric");

%% Unsharp masking
% Perform unsharp masking using lp2, here:
% Same method used as in preparation tasks

[m,n] = size(lp2);
impulse = zeros(m,n);
impulse(floor(m/2)+1, floor(n/2)+1) = 1;

hp2 = impulse - lp2; %Create highpass filter from lp2
oum = im + imfilter(im, hp2, "symmetric"); %Add original image to highpass filtered image

%% Highboost filtering
% Perform highboost filtering using lp2 (use k=2.5), here:

ohb = im + 2.5 * imfilter(im, hp2, "symmetric"); %Same process as above, with k = 2.5 instead of k=1


%% Test your code
% Test your code on different images using different lowpass filters as
% input arguments. Specially, it is interesting to test your code on the
% image called zonplate.tif. This image contains different frequencies and
% it is interesting to study how different filters pass some frequencies
% and block others. As the filter kernels, it is interesting to
% try different box and Gaussian filters.
