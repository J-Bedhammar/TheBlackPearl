%% TNM034 OMR Project
% Authors: Jennifer Bedhammar, Julius Kördel, Oliver Johansson.
% Last edit: 2019-02-06
%% Clear all, clc
clear all;
close all;
clc;

% Load testimage
path = fullfile('Images', 'imagename'); % 3,5
testImage = imread(path);
testImage = im2double(testImage);
% Call function
output = TNM097

%% Show image
figure();
imshow(testImage);

