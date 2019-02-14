function [outimg] = addGrid(inimg)
%Author: Oliver Johansson
%Adds a grid intop of the image to visualize the pearls position

PearlsPerRow = 4;

[width,height, dim] = size(inimg);

ratio = height/width;

PearlsPerCol = floor(PearlsPerRow*ratio);

ColDist = floor(width/PearlsPerRow);
RowDist = floor(height/PearlsPerCol);

outimg = inimg;

for w = 1:ColDist:width
     outimg(:,w,:) = 0;
end

for h = 1:RowDist:height
    outimg(h,:,:) = 0;
end
     
end

