function [PearlsPerRow, PearlsPerCol] = addGrid(inimg, PearlSize, option)
% Author: Oliver Johansson
% Adds a grid ontop of the image to visualize the pearls position

% Calculates the dimensions of the image
[Height, Width, dim] = size(inimg);

% Calculates the ratio between the height and the width of the image
ratio = Height/Width;

if(option == 1)
    PearlsPerRow = floor(Width/PearlSize);

    % Calculates the number of pearls per column depedning on pearls per rows
    % and the ratio of the image.
    PearlsPerCol = ceil(PearlsPerRow*ratio);
else
    PearlsPerRow = option;

    % Calculates the number of pearls per column depedning on pearls per rows
    % and the ratio of the image.
    PearlsPerCol = ceil(PearlsPerRow*ratio);
end

end

