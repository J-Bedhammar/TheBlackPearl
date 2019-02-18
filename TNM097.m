function [ image ] = TNM097( im ,numberOfColors,numberOfL)
% TNM097
% insert code that calls functions here

% Add grid to image
PearlsPerRow = 60;
[imGrid, ColDist, RowDist] = addGrid(im, PearlsPerRow);

ppi = 200;
pearlSize = 40;

% Pearl colors:
% 1 = 100, 2 = 80, 3 = 64, 4 = 48, 5 = 27, 6 = 18, 7 = 12, 8 = 8, 9 = 4
RGBRange = colorSteps(1);
[pearlPlate,pearlSingleArray] = pearlColors(pearlSize,RGBRange);

imshow(pearlPlate);

% Mean colors of grid squares
[meanGrid] = meanColorInGrid(im,ColDist,RowDist);

indexPearlGrid = indexColorMatch(pearlSingleArray, meanGrid);
figure
[pearlifiedIm] = assemble(indexPearlGrid,ColDist,RowDist,size(im),pearlSingleArray);

[X_no_dither,map] = rgb2ind(im,8,'nodither');

pearls = drawCircles(im, ColDist, RowDist, indexPearlGrid, pearlSingleArray);

image = pearls;

end