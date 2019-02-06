%% TNM034 OMR Project
% Authors: Jennifer Bedhammar, Julius K�rdel, Oliver Johansson.
% Last edit: 2019-02-06
%% Clear all, clc
clear all;
close all;
clc;

% Load testimage
path = fullfile('Images', 'test1.png'); % 3,5
testImage = imread(path);
testImage = im2double(testImage);
% Call function
output = TNM097(testImage)

%% Show image
figure();
imshow(testImage);

