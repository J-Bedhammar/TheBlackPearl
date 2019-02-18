function rgb = addPearl(Img, Center, colDist)

[sr,sc] = size(Img);
[columnsInImage rowsInImage] = meshgrid(1:sc, 1:sr);

% Next create the circle in the image.
radius = colDist*4;
centerY = Center(:,2);
centerX = Center(:,1);
s = abs(Center(:,1) - (Center(:,1) + radius));
t = abs(Center(:,2) - (Center(:,2) + 0));
radius = sqrt(s^2 + t^2);
circle = ((rowsInImage - Center(:,2))/radius).^2 + ((columnsInImage - Center(:,1))/radius).^2 ;

threshold = circle(Center(:,2) + s, Center(:,1) + t);

circlePixels = circle <= threshold;

R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);

R(circlePixels) = 255;
G(circlePixels) = 0;
B(circlePixels) = 0;
rgb = cat(3, R, G, B);

end

