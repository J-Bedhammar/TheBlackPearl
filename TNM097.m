function [ image ] = TNM097( im ,numberOfColors,numberOfL)
% TNM097
% insert code that calls functions here
ppi = 200;
pearlSize = 40;
RGBRange = [4,5,5];
[pearlColors,pearlSingleArray] = pearlColors(pearlSize,RGBRange);

image = addGrid(im)
