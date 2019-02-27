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
%temp = imresize(im,[PearlsPerCol,PearlsPerRow]);

% Pearl colors:
% 1 = 100, 2 = 80, 3 = 64, 4 = 48, 5 = 27, 6 = 18, 7 = 12, 8 = 8, 9 = 4
RGBRange = colorSteps(1);
% Set up pearls color in list
[pearlPlate,pearlSingleArray] = pearlColors(pearlSize,RGBRange);
[pearlPlate2,pearlSingleArray2] = pearlColors(pearlSize,RGBRange);
lessPerls = lessNumberOfPearls(pearlSingleArray,50);

 % Create pearls out of the pearlSingleArray
pearlCollection = createPearls(pearlSingleArray, ColDist, RowDist, im, "nope");
pearlCollectionBalanced = createPearls(pearlSingleArray, ColDist, RowDist, im, "balanced");

% Mean colors of grid squares
[meanGrid] = meanColorInGrid(im,ColDist,RowDist);

% Find matching colors - image and pearls
indexPearlGrid = indexColorMatch(pearlSingleArray, meanGrid);
[RemovedNonExistingPearls,newIndexPearlGrid,limitedNumberOfPearls] = removeNonExistingColors(pearlSingleArray,indexPearlGrid,50);
lessPerlsRemovedNoneExisting = lessNumberOfPearls(RemovedNonExistingPearls,50);
indexPearlGridRemovedNonExisting = indexColorMatch(lessPerlsRemovedNoneExisting, meanGrid);
indexPearlGridRemovedNonExistingAndReduced = indexColorMatch(limitedNumberOfPearls, meanGrid);

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


[quality] = qualityScieLab( im, allThemPearls, 1920, 20.8661417, 20 )
[quality1] = qualityScieLab( im, allThemPearlsBalanced, 1920, 20.8661417, 20 )



% Create image with rectangle
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