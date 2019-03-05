%% TNM034 OMR Project
% Authors: Jennifer Bedhammar, Julius Kördel, Oliver Johansson.
% Last edit: 2019-02-14

%% Clear all, clc
clear variables;
close all;
clc;

% Load testimage
path = fullfile('Images', 'calico-kitten.jpg'); % 3,5
testImage = imread(path);
testImage = im2double(testImage);
numberOfColors = 100; 
numberOfL = 3;

% Call function
output = TNM097(testImage,numberOfColors,numberOfL);

%% Show image
subplot(1,2,1)
imshow(testImage);
title('Original')

subplot(1,2,2)
imshow(output);
title('TNM097 Output')

