function [ image ] = TNM097(IM, numberOfColors, numberOfL)
% TNM097
% insert code that calls functions here

% Add grid to image
pearlSize = 10;
[x,y,z] = size(IM);
newY = roundn(y,1);
newX = roundn(x,1);
% resize so that pearlsize matches
im = imresize(IM,[newX,newY]);
%PearlsPerRow = floor(x/pearlSize)
[PearlsPerRow, PearlsPerCol] = addGrid(im, pearlSize);
ColDist=pearlSize;
RowDist=pearlSize;
% temp is used if wanting to compare resized to pixel size
resizedIm = imresize(im,[PearlsPerCol,PearlsPerRow]);

% Pearl colors:
% 1 = 100, 2 = 80, 3 = 64, 4 = 48, 5 = 27, 6 = 18, 7 = 12, 8 = 8, 9 = 4
RGBRange = colorSteps(1);
% Set up pearls color in list
[pearlPlate,pearlSingleArray] = pearlColors(pearlSize,RGBRange);
[pearlPlate2,pearlSingleArray2] = pearlColors(pearlSize,RGBRange);
lessPerls = lessNumberOfPearls(pearlSingleArray,50);

 % Create pearls out of the pearlSingleArray
 % whichBackgrund, 0 = BW, 1 = BWG, 2 = mean value
pearlCollection = createPearls(pearlSingleArray, ColDist, RowDist, im, "nope", 0);
pearlCollectionBWG = createPearls(pearlSingleArray, ColDist, RowDist, im, "nope", 1);
pearlCollectionMean = createPearls(pearlSingleArray, ColDist, RowDist, im, "nope", 2);
pearlCollectionBalanced = createPearls(pearlSingleArray, ColDist, RowDist, im, "balanced", 0);

% Mean colors of grid squares
[meanGrid] = meanColorInGrid(im,ColDist,RowDist);

% Find matching colors - image and pearls
indexPearlGrid = indexColorMatch(pearlSingleArray, meanGrid);
% [RemovedNonExistingPearls,newIndexPearlGrid,limitedByFrequency] = removeNonExistingColors(pearlSingleArray,indexPearlGrid,50);
% limitedBySum = lessNumberOfPearls(RemovedNonExistingPearls,50);
% indexPearlGridRemovedNonExisting = indexColorMatch(limitedBySum, meanGrid);
% indexPearlGridRemovedNonExistingAndReduced = indexColorMatch(limitedByFrequency, meanGrid);
% indexPearlGridResized = indexColorMatch(pearlSingleArray,resizedIm );


% Create image with the pearls in pearlsCollection. 
allThemPearls = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGrid, pearlCollection);
allThemPearlsBWG = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGrid, pearlCollectionBWG);
allThemPearlsMean = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGrid, pearlCollectionMean);
% allThemPearlsBalanced = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGrid, pearlCollectionBalanced);

%Plot pearls - unbalanced and balanced
subplot(1,3,1)
imshow(allThemPearls)
title("BW")
subplot(1,3,2)
imshow(allThemPearlsBWG)
title("BWG")
subplot(1,3,3)
imshow(allThemPearlsMean)
title("Mean")

[quality] = qualityScieLab( im, allThemPearls, 1920, 20.8661417, 20 )
[qualityBWG] = qualityScieLab( im, allThemPearlsBWG, 1920, 20.8661417, 20 )
[qualityMean] = qualityScieLab( im, allThemPearlsMean, 1920, 20.8661417, 20 )
[quality1] = qualityScieLab( im, allThemPearlsBalanced, 1920, 20.8661417, 20 )

% Create image with rectangle
figure
[pearlifiedIm] = assemble(indexPearlGrid,PearlsPerCol,PearlsPerRow,(ColDist/20),pearlSingleArray,RowDist,ColDist);
title("100pearls")
figure
[pearlifiedIm2] = assemble(newIndexPearlGrid,PearlsPerCol,PearlsPerRow,(ColDist/20),RemovedNonExistingPearls,RowDist,ColDist);
title("removed non existing")
figure
[pearlifiedIm3] = assemble(indexPearlGridRemovedNonExisting,PearlsPerCol,PearlsPerRow,(ColDist/20),limitedBySum,RowDist,ColDist);
title("by sum")
figure
[pearlifiedIm4] = assemble(indexPearlGridRemovedNonExistingAndReduced,PearlsPerCol,PearlsPerRow,(ColDist/20),limitedByFrequency,RowDist,ColDist);
title("by frequency")
figure
[pearlifiedIm5] = assemble(indexPearlGridResized,PearlsPerCol,PearlsPerRow,(ColDist/20),pearlSingleArray,RowDist,ColDist);
title("resize")

pearlCollection2 = createPearls(RemovedNonExistingPearls, ColDist, RowDist, im, "nope");
pearlCollection3 = createPearls(limitedBySum, ColDist, RowDist, im, "nope");
pearlCollection4 = createPearls(limitedByFrequency, ColDist, RowDist, im, "nope");
pearlCollection5 = createPearls(pearlSingleArray, ColDist, RowDist, im, "nope");

allThemPearls2 = drawCircles(PearlsPerCol, PearlsPerRow, newIndexPearlGrid, pearlCollection2);
allThemPearls3 = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGridRemovedNonExisting, pearlCollection3);
allThemPearls4 = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGridRemovedNonExistingAndReduced, pearlCollection4);
allThemPearls5 = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGridResized, pearlCollection5);
allThemPearls6 = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGrid, pearlCollection5);


figure
subplot(2,2,1)
imshow(im)
title("Original")
subplot(2,2,2)
imshow(allThemPearls2)
title("Removed non-existing")
[quality2] = qualityScieLab( im, allThemPearls2, 1920, 20.8661417, 20 )
subplot(2,2,3)
imshow(allThemPearls3)
title("By sum")
[quality3] = qualityScieLab( im, allThemPearls3, 1920, 20.8661417, 20 )
subplot(2,2,4)
imshow(allThemPearls4)
title("By frequency")
[quality4] = qualityScieLab( im, allThemPearls4, 1920, 20.8661417, 20 )

figure
subplot(1,2,1)
imshow(allThemPearls5)
title("100 pearls")
[quality5] = qualityScieLab( im, allThemPearls5, 1920, 20.8661417, 20 )

subplot(1,2,2)
imshow(allThemPearls6)
title("100 pearls resized")
[quality6] = qualityScieLab( im, allThemPearls6, 1920, 20.8661417, 20 )


figure
[X_no_dither,map] = rgb2ind(im,8,'nodither');
%imshow(X_no_dither,map)

%imshow(pearlPlate)

image = pearlifiedIm;

end