function [ indexMatrix ] = indexColorMatch(pearlSingleArray,meanGrid)
% Input:
%   - pearlSingleArray: pearl colors [3D array, RGB]
%   - meanGrid: mean color of Grid squares [marix]

% Change pearls from RGB to L*a*b for color matching
pearlSingleLab = zeros(size(pearlSingleArray));
for i = 1:length(pearlSingleArray)
    pearlSingleLab(1,i,:) = rgb2lab(pearlSingleArray(1,i,:));
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

