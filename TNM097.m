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
[RemovedNonExistingPearls,newIndexPearlGrid,limitedNumberOfPearls] = removeNonExistingColors(pearlSingleArray,indexPearlGrid,50);
lessPerlsRemovedNoneExisting = lessNumberOfPearls(RemovedNonExistingPearls,50);
indexPearlGridRemovedNonExisting = indexColorMatch(lessPerlsRemovedNoneExisting, meanGrid);
indexPearlGridRemovedNonExistingAndReduced = indexColorMatch(limitedNumberOfPearls, meanGrid);


figure
[pearlifiedIm] = assemble(indexPearlGrid,PearlsPerCol,PearlsPerRow,(ColDist/20),pearlSingleArray,RowDist,ColDist);
figure
[pearlifiedIm2] = assemble(newIndexPearlGrid,PearlsPerCol,PearlsPerRow,(ColDist/20),RemovedNonExistingPearls,RowDist,ColDist);
figure
[pearlifiedIm3] = assemble(indexPearlGridRemovedNonExisting,PearlsPerCol,PearlsPerRow,(ColDist/20),lessPerlsRemovedNoneExisting,RowDist,ColDist);
figure
[pearlifiedIm4] = assemble(indexPearlGridRemovedNonExistingAndReduced,PearlsPerCol,PearlsPerRow,(ColDist/20),limitedNumberOfPearls,RowDist,ColDist);

figure
[X_no_dither,map] = rgb2ind(im,8,'nodither');
%imshow(X_no_dither,map)

%imshow(pearlPlate)

image = pearlifiedIm;

end