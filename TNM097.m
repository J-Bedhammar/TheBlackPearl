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
RGBRange2 = colorSteps(4);
[pearlPlate,pearlSingleArray] = pearlColors(pearlSize,RGBRange);
[pearlPlate2,pearlSingleArray2] = pearlColors(pearlSize,RGBRange);
% lessPerls = lessNumberOfPearls(pearlSingleArray,50);

%imshow(pearlPlate);

% Mean colors of grid squares
[meanGrid] = meanColorInGrid(im,ColDist,RowDist);

indexPearlGrid = indexColorMatch(pearlSingleArray, meanGrid);
% indexPearlGrid2 = indexColorMatch(pearlSingleArray2, meanGrid);
% indexPearlGrid3 = indexColorMatch(lessPerls, meanGrid);


figure
[pearlifiedIm] = assemble(indexPearlGrid,ColDist,RowDist,size(im),pearlSingleArray);
% figure
% [pearlifiedIm2] = assemble(indexPearlGrid2,ColDist,RowDist,size(im),pearlSingleArray2);
% figure
% [pearlifiedIm2] = assemble(indexPearlGrid3,ColDist,RowDist,size(im),lessPerls);


[X_no_dither,map] = rgb2ind(im,8,'nodither');

pearls = drawCircles(im, ColDist, RowDist, indexPearlGrid, pearlSingleArray);

image = pearls;

end