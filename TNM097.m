function [ image ] = TNM097(im ,numberOfColors,numberOfL)
% TNM097
% insert code that calls functions here

% Add grid to image
PearlsPerRow = 120;
[PearlsPerCol, ColDist, RowDist] = addGrid(im, PearlsPerRow);

temp =imresize(im,[PearlsPerCol,PearlsPerRow]);

ppi = 200;
pearlSize = 20;

% Pearl colors:
% 1 = 100, 2 = 80, 3 = 64, 4 = 48, 5 = 27, 6 = 18, 7 = 12, 8 = 8, 9 = 4
RGBRange = colorSteps(1);
[pearlPlate,pearlSingleArray] = pearlColors(pearlSize,RGBRange);
[pearlPlate2,pearlSingleArray2] = pearlColors(pearlSize,RGBRange);
lessPerls = lessNumberOfPearls(pearlSingleArray,50);


onePearl = createPearls(pearlSingleArray, ColDist, RowDist);
% Mean colors of grid squares
[meanGrid] = meanColorInGrid(im,ColDist,RowDist);

indexPearlGrid = indexColorMatch(pearlSingleArray, meanGrid);
indexPearlGrid4 = indexColorMatch(pearlSingleArray, temp);
%indexPearlGrid2 = indexColorMatch(pearlSingleArray2, meanGrid);
%indexPearlGrid3 = indexColorMatch(lessPerls, meanGrid);
%indexPearlGrid4 = indexColorMatch(pearlSingleArray, temp);


figure
[pearlifiedIm] = assemble(indexPearlGrid,ColDist,RowDist,size(im),pearlSingleArray);

title("100 valda ")
%figure
% [pearlifiedIm2] = assemble(indexPearlGrid2,ColDist,RowDist,size(im),pearlSingleArray2);
% title("50 valda")
% figure
% [pearlifiedIm3] = assemble(indexPearlGrid3,ColDist,RowDist,size(im),lessPerls);
% title("50valda lab")
figure
[pearlifiedIm4] = assemble(indexPearlGrid4,ColDist,RowDist,size(im),pearlSingleArray);
title("resize ")
figure

[X_no_dither,map] = rgb2ind(im,8,'nodither');
%imshow(X_no_dither,map)

%imshow(pearlPlate)

image = pearlifiedIm;

end