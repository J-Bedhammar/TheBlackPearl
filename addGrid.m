function [PearlsPerCol, ColDist, RowDist] = addGrid(inimg,PearlsPerRow)
% Author: Oliver Johansson
% Adds a grid ontop of the image to visualize the pearls position

% Calculates the dimensions of the image
[height, width, dim] = size(inimg);

% Calculates the ratio between the height and the width of the image
ratio = height/width;

% Calculates the number of pearls per column depedning on pearls per rows
% and the ratio of the image.
PearlsPerCol = PearlsPerRow*ratio;

% Calculates the distance between the rows and cols
ColDist = floor(width/PearlsPerRow);
RowDist = floor(height/PearlsPerCol);

% Floor PearlsPerCol
PearlsPerCol = floor(PearlsPerCol);

end

