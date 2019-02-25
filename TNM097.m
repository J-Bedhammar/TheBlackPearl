function [ image ] = TNM097(im ,numberOfColors,numberOfL)
% TNM097
% insert code that calls functions here

% Add grid to image
PearlsPerRow = 80;
[PearlsPerCol, ColDist, RowDist] = addGrid(im, PearlsPerRow);

ppi = 200;
pearlSize = 20;

% Pearl colors:
% 1 = 100, 2 = 80, 3 = 64, 4 = 48, 5 = 27, 6 = 18, 7 = 12, 8 = 8, 9 = 4
RGBRange = colorSteps(1);
[pearlPlate,pearlSingleArray] = pearlColors(pearlSize,RGBRange);

[pearlPlate2,pearlSingleArray2] = pearlColors(pearlSize,RGBRange);
 lessPerls = lessNumberOfPearls(pearlSingleArray,50);

 % Create pearls out of the pearlSingleArray
pearlCollection = createPearls(pearlSingleArray, ColDist, RowDist, "black", "nope");
pearlCollectionBalanced = createPearls(pearlSingleArray, ColDist, RowDist, "black", "balanced");

% Mean colors of grid squares
[meanGrid] = meanColorInGrid(im,ColDist,RowDist);

% Find matching colors - image and pearls
indexPearlGrid = indexColorMatch(pearlSingleArray, meanGrid);
indexPearlGrid2 = indexColorMatch(pearlSingleArray2, meanGrid);
indexPearlGrid3 = indexColorMatch(lessPerls, meanGrid);

% Create image with the pearls in pearlsCollection. 
allThemPearls = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGrid, pearlCollection);
allThemPearlsBalanced = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGrid, pearlCollectionBalanced);

% Plot pearls - unbalanced and balanced
subplot(1,2,1)
imshow(allThemPearls)
title("Unbalanced")
subplot(1,2,2)
imshow(allThemPearlsBalanced)
title("Balanced")

% Create image with rectangle
[pearlifiedIm] = assemble(indexPearlGrid,ColDist,RowDist,size(im),pearlSingleArray);

title("100 valda ")
figure
[pearlifiedIm2] = assemble(indexPearlGrid2,ColDist,RowDist,size(im),pearlSingleArray2);
title("50 valda")
figure
[pearlifiedIm2] = assemble(indexPearlGrid3,ColDist,RowDist,size(im),lessPerls);
title("50valda lab")

[X_no_dither,map] = rgb2ind(im,8,'nodither');
%imshow(X_no_dither,map)

%imshow(pearlPlate)

image = pearlifiedIm;

end