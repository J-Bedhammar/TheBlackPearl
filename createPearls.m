function [ pearlCell ] = createPearls(pearlSingleArray, colDist, rowDist, im, mode)

meanImColor = mean(mean(mean(im)));
if(meanImColor >= 0.5)
    background = "white";
else
    background = "black";
end

pearlArraySize = size(pearlSingleArray);
pearlCell = cell( pearlArraySize(1), pearlArraySize(2) );

for i = 1:length(pearlSingleArray)
    rgb(1,:) = pearlSingleArray(1,i,:);
    
    if( background == "white")
        Img = ones(rowDist, colDist, 3);
        color = 255;
        if( mode == "balanced")
            rgb = rgb * (1 - (0.5*(1 - meanImColor)));
        end
    else
        Img = zeros(rowDist, colDist, 3);
        color = 0;
        if( mode == "balanced")
            rgb = rgb * (1 + (0.5*(0.5 - meanImColor)));
        end
    end
        
    Center = [floor(colDist/2) floor(rowDist/2)];
    
    pearl = addPearl(Img, Center, colDist, rgb, color);
    
    pearlCell{1,i} = pearl;
end



end

