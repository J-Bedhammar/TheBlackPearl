function [ indexMatrix ] = indexColorMatch(pearlSingleArray,meanGrid,inPearlCollection)
% Input:
%   - pearlSingleArray: pearl colors [3D array, RGB]
%   - meanGrid: mean color of Grid squares [marix]

% Change pearls from RGB to L*a*b for color matching

pearlSingleLab = zeros(size(pearlSingleArray));
pearlCollection = cell2mat(inPearlCollection);
[dimx,dimy,dimz] = size(pearlCollection);
for i = 1:length(pearlSingleArray)
    pearlSingleLab(1,i,:) = rgb2lab(mean(mean(inPearlCollection{i})));
    %imshow(pearlCollection(1:10,((i-1)*dimx+1):i*dimx,:))
end

% Create new index matrix
gridSize = size(meanGrid);
indexMatrix = zeros(gridSize(1),gridSize(2)); 

% Save index of best color match (pearl color vs mean color)
for r = 1:gridSize(1)
    for c = 1:gridSize(2)
        indexColor = compareLab(pearlSingleLab, meanGrid(r,c,:));
        indexMatrix(r,c) = indexColor;
    end
end


end

