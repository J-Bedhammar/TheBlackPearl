function [ image ] = TNM097( im ,numberOfColors,numberOfL)
% TNM097
% insert code that calls functions here

% Add grid to image
imGrid = addGrid(im);

ppi = 200;
pearlSize = 40;

% 1 = 100, 2 = 80, 3 = 64, 4 = 48, 5 = 27, 6 = 18, 7 = 12, 8 = 8, 9 = 4
RGBRange = colorSteps(1);
[pearlPlate,pearlSingleArray] = pearlColors(pearlSize,RGBRange);

%imshow(pearlPlate)


image = imGrid;

end


