function [ image ] = TNM097(IM, numberOfColors, numberOfL)
% TNM097
% insert code that calls functions here

% S-CIELab variables, screen info
screenPixels = 1920;
screenInches = 14.17; % 36cm
distance = 19.68;  % 50cm

% Add grid to image
pearlSize = 10;
pearlSize2 = 27;
rowPearls = 100;
[x,y,z] = size(IM);
newY = roundn(y,1);
newX = roundn(x,1);
% resize so that pearlsize matches
im = imresize(IM,[newX,newY]);
%PearlsPerRow = floor(x/pearlSize)
% 1 = as normal, anything else modifies pearls per row
[PearlsPerRow, PearlsPerCol] = addGrid(im, pearlSize,1);
[PearlsPerRow2, PearlsPerCol2] = addGrid(im, pearlSize2, rowPearls);
ColDist=pearlSize;
RowDist=pearlSize;
ColDist2=pearlSize2;
RowDist2=pearlSize2;
% temp is used if wanting to compare resized to pixel size
resizedIm = imresize(im,[PearlsPerCol,PearlsPerRow]);
resizedIm2 = imresize(im,[PearlsPerCol2,PearlsPerRow2]);


% Pearl colors:
% 1 = 100, 2 = 80, 3 = 64, 4 = 48, 5 = 27, 6 = 18, 7 = 12, 8 = 8, 9 = 4
RGBRange = colorSteps(1);
RGBRange48 = colorSteps(4);
% Set up pearls color in list
[pearlPlate,pearlSingleArray] = pearlColors(pearlSize,RGBRange);
[pearlPlate2,pearlSingleArray2] = pearlColors(pearlSize2,RGBRange);
[pearlPlate48,pearlSingleArray48] = pearlColors(pearlSize,RGBRange48);

%lessPerls = lessNumberOfPearls(pearlSingleArray,50);

%Dither. to extrect the 50 most viable colors
[X_no_dither,dithermap] = rgb2ind(im,50,'nodither');

map(1,:,:) = dithermap;
 % Create pearls out of the pearlSingleArray
 % whichBackgrund, 0 = BW, 1 = BWG, 2 = mean value
pearlCollection = createPearls(pearlSingleArray, ColDist, RowDist, im, "nope", 0);
pearlCollection2 = createPearls(pearlSingleArray2, ColDist, RowDist, im, "nope", 0);
pearlCollectionBWG = createPearls(pearlSingleArray, ColDist, RowDist, im, "nope", 1);
pearlCollectionMean = createPearls(pearlSingleArray, ColDist, RowDist, im, "nope", 2);
pearlCollection48 = createPearls(pearlSingleArray48, ColDist, RowDist, im, "nope", 0);

%pearlCollectionBalanced = createPearls(pearlSingleArray, ColDist, RowDist, im, "balanced", 0);

% Mean colors of grid squares
[meanGrid] = meanColorInGrid(im,ColDist,RowDist);

% Find matching colors - image and pearls
indexPearlGrid = indexColorMatch(pearlSingleArray, meanGrid);
[RemovedNonExistingPearls,newIndexPearlGrid,limitedByFrequency] = removeNonExistingColors(pearlSingleArray,indexPearlGrid,50);
limitedBySum = lessNumberOfPearls(RemovedNonExistingPearls,50);
indexPearlGridRemovedNonExisting = indexColorMatch(limitedBySum, meanGrid);
indexPearlGridRemovedNonExistingAndReduced = indexColorMatch(limitedByFrequency, meanGrid);
indexPearlGridResized = indexColorMatch(pearlSingleArray,resizedIm);
PearlGridRezised = indexColorMatch(pearlSingleArray2,resizedIm2);
ditherGridRezised = indexColorMatch(map,resizedIm2);
indexPearlGrid48 = indexColorMatch(pearlSingleArray48, meanGrid);



% Create image with the pearls in pearlsCollection. 
allThemPearls = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGrid, pearlCollection);
allThemPearlsBWG = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGrid, pearlCollectionBWG);
allThemPearlsMean = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGrid, pearlCollectionMean);



% Create image with rectangle
% figure
% [pearlifiedIm] = assemble(indexPearlGrid,PearlsPerCol,PearlsPerRow,(ColDist/20),pearlSingleArray,RowDist,ColDist);
% title("100pearls")
% figure
% [pearlifiedIm2] = assemble(newIndexPearlGrid,PearlsPerCol,PearlsPerRow,(ColDist/20),RemovedNonExistingPearls,RowDist,ColDist);
% title("removed non existing")
% figure
% [pearlifiedIm3] = assemble(indexPearlGridRemovedNonExisting,PearlsPerCol,PearlsPerRow,(ColDist/20),limitedBySum,RowDist,ColDist);
% title("by sum")
% figure
% [pearlifiedIm4] = assemble(indexPearlGridRemovedNonExistingAndReduced,PearlsPerCol,PearlsPerRow,(ColDist/20),limitedByFrequency,RowDist,ColDist);
% title("by frequency")
% figure
% [pearlifiedIm5] = assemble(indexPearlGridResized,PearlsPerCol,PearlsPerRow,(ColDist/20),pearlSingleArray,RowDist,ColDist);
% title("resize")

pearlCollection2 = createPearls(RemovedNonExistingPearls, ColDist, RowDist, im, "nope",0);
pearlCollection3 = createPearls(limitedBySum, ColDist, RowDist, im, "nope",0);
pearlCollection4 = createPearls(limitedByFrequency, ColDist, RowDist, im, "nope",0);
pearlCollection5 = createPearls(pearlSingleArray, ColDist, RowDist, im, "nope",0);
ditherCollection = createPearls(map, ColDist2, RowDist2, im, "nope",0);
pearlCollection48 = createPearls(pearlSingleArray48, ColDist, RowDist, im, "nope",0);


allThemPearls2 = drawCircles(PearlsPerCol, PearlsPerRow, newIndexPearlGrid, pearlCollection2);
allThemPearls3 = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGridRemovedNonExisting, pearlCollection3);
allThemPearls4 = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGridRemovedNonExistingAndReduced, pearlCollection4);
allThemPearls5 = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGridResized, pearlCollection5);
allThemPearls6 = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGrid, pearlCollection5);
allThemPearls7 = drawCircles(PearlsPerCol2, PearlsPerRow2, PearlGridRezised, pearlCollection5);
ditherPearls = drawCircles(PearlsPerCol2, PearlsPerRow2, ditherGridRezised, ditherCollection);
allThemPearls48 = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGrid48, pearlCollection48);

% Find matching colors - image and pearls
indexPearlGridPearl = indexColorMatchPearls(pearlSingleArray, meanGrid,pearlCollection);
[RemovedNonExistingPearls2,newIndexPearlGrid2,limitedByFrequency2] = removeNonExistingColors(pearlSingleArray,indexPearlGridPearl,50);
limitedBySum2 = lessNumberOfPearls(RemovedNonExistingPearls2,50);
indexPearlGridRemovedNonExisting2 = indexColorMatch(limitedBySum2, meanGrid);
indexPearlGridRemovedNonExistingAndReduced2 = indexColorMatch(limitedByFrequency2, meanGrid);

pearlCollection22 = createPearls(RemovedNonExistingPearls2, ColDist, RowDist, im, "nope",0);
pearlCollection32 = createPearls(limitedBySum2, ColDist, RowDist, im, "nope",0);
pearlCollection42 = createPearls(limitedByFrequency2, ColDist, RowDist, im, "nope",0);

allThemPearls22 = drawCircles(PearlsPerCol, PearlsPerRow, newIndexPearlGrid2, pearlCollection22);
allThemPearls32 = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGridRemovedNonExisting2, pearlCollection32);
allThemPearls42 = drawCircles(PearlsPerCol, PearlsPerRow, indexPearlGridRemovedNonExistingAndReduced2, pearlCollection42);

%Plot pearls - different background settings
subplot(1,3,1)
imshow(allThemPearls)
title("BW")
subplot(1,3,2)
imshow(allThemPearlsBWG)
title("BWG")
subplot(1,3,3)
imshow(allThemPearlsMean)
title("Mean")
 
[quality] = qualityScieLab( im, allThemPearls, screenPixels, screenInches, distance )
[qualityBWG] = qualityScieLab( im, allThemPearlsBWG, screenPixels, screenInches, distance  )
[qualityMean] = qualityScieLab( im, allThemPearlsMean, screenPixels, screenInches, distance  )




figure
subplot(2,2,1)
imshow(im)
title("Original")
subplot(2,2,2)
imshow(allThemPearls2)
title("Removed non-existing")
[qualityRemovedNonUsedPearls] = qualityScieLab( im, allThemPearls2, screenPixels, screenInches, distance )
subplot(2,2,3)
imshow(allThemPearls3)
title("By sum")
[qualityWhenFurtherRemovedBySum] = qualityScieLab( im, allThemPearls3, screenPixels, screenInches, distance )
subplot(2,2,4)
imshow(allThemPearls4)
title("By Occurence")
[qualityWhenFurtherRemovedByOccurence] = qualityScieLab( im, allThemPearls4, screenPixels, screenInches, distance  )

figure
subplot(2,2,1)
imshow(im)
title("Original")
subplot(2,2,2)
imshow(allThemPearls22)
title("Removed non-existing")
[qualityRemovedNonUsedPearlsDependingOnBakground] = qualityScieLab( im, allThemPearls22, screenPixels, screenInches, distance )
subplot(2,2,3)
imshow(allThemPearls32)
title("By sum")
[qualityWhenFurtherRemovedBySumDependingOnBakground] = qualityScieLab( im, allThemPearls32, screenPixels, screenInches, distance  )
subplot(2,2,4)
imshow(allThemPearls42)
title("By frequency")
[qualityWhenFurtherRemovedByOccurenceDependingOnBakground] = qualityScieLab( im, allThemPearls42, screenPixels, screenInches, distance  )


 
figure
subplot(2,2,1)
imshow(allThemPearls5)
title("100 pearls")
[qualityOGIm100Pearls] = qualityScieLab( im, allThemPearls5, screenPixels, screenInches, distance )

subplot(2,2,2)
imshow(allThemPearls6)
title("100 pearls resized")
[qualityResizedOGIm100Pearls] = qualityScieLab( im, allThemPearls6, screenPixels, screenInches, distance )


subplot(2,2,3)
imshow(allThemPearls48)
title("48 pearls")
[quality48Pearls] = qualityScieLab( im, allThemPearls48, screenPixels, screenInches, distance )


% figure
% [X_no_dither,map] = rgb2ind(im,8,'nodither');
% %imshow(X_no_dither,map)

image = allThemPearls22;

end