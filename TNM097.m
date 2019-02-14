function [ image ] = TNM097( im ,numberOfColors,numberOfL)
% TNM097
% insert code that calls functions here

% Add grid to image
PearlsPerRow = 20;
[imGrid, ColDist, RowDist] = addGrid(im, PearlsPerRow);

ppi = 200;
pearlSize = 40;

% Pearl colors:
% 1 = 100, 2 = 80, 3 = 64, 4 = 48, 5 = 27, 6 = 18, 7 = 12, 8 = 8, 9 = 4
RGBRange = colorSteps(1);
[pearlPlate,pearlSingleArray] = pearlColors(pearlSize,RGBRange);

% Change pearls from RGB to L*a*b for color matching
pearlSingleLab = zeros(size(pearlSingleArray));
for i = 1:length(pearlSingleArray)
    pearlSingleLab(1,i,:) = rgb2lab(pearlSingleArray(1,i,:));
end

testColor = [0, 0, 0];

colorIndex = compareLab(pearlSingleLab, testColor);

colorIndex

% Mean colors of grid squares
%[meanGrid] = meanColorInGrid(im,ColDist,RowDist)

%imshow(pearlPlate)

image = imGrid;


end


