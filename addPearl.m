function rgb = addPearl(Img, Center, colDist, rgb, background, whichBackground)

[sr,sc] = size(Img);
[columnsInImage rowsInImage] = meshgrid(1:sc, 1:sr);

% Next create the circle in the image.
radius = colDist/2 - 0.5;
innerRadius = colDist/5 - 0.5;
centerY = Center(:,2);
centerX = Center(:,1);

% Big circle
s = floor(abs(centerX - (centerX + radius)));
t = floor(abs(centerY - (centerY + 0)));
circle = ((rowsInImage - centerY)/radius).^2 + ((columnsInImage - centerX)/radius).^2 ;

% Smol circle
s2 = floor(abs(centerX - (centerX + innerRadius)));
t2 = floor(abs(centerY - (centerY + 0)));
smallCircle = ((rowsInImage - centerY)/innerRadius).^2 + ((columnsInImage - centerX)/innerRadius).^2 ;

% Thresholds
threshold = circle(centerY + s, centerX + t);
innerThreshold = smallCircle(centerY + s2, centerX + t2);

R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);

% Big circle
circlePixels = circle <= threshold;

R(circlePixels) = rgb(1,1);
G(circlePixels) = rgb(1,2);
B(circlePixels) = rgb(1,3);

% Smol circle
smallCirclePixels = smallCircle <= innerThreshold;

if( whichBackground == 2)
    R(smallCirclePixels) = background(:,:,1);
    G(smallCirclePixels) = background(:,:,2);
    B(smallCirclePixels) = background(:,:,3);
else
    R(smallCirclePixels) = background;
    G(smallCirclePixels) = background;
    B(smallCirclePixels) = background;
end

% Output
rgb = cat(3, R, G, B);

end

