function [ pearlCell ] = createPearls(pearlSingleArray, colDist, rowDist, im, mode, whichBackground)

meanImColor = mean(mean(mean(im)));
meanImColorRGB = mean(mean(im));

if(whichBackground == 0)    % Black and white
   if(meanImColor >= 0.5)
       background = "white";
   else
       background = "black";
   end
elseif(whichBackground == 1) % Black, white and gray
    if(meanImColor >= 0.7)
       background = "white";
    elseif(meanImColor <= 0.3)
        background = "black";
    else
        background = "gray";
    end
else
    background = "mean";        % Mean color
end

pearlArraySize = size(pearlSingleArray);
pearlCell = cell( pearlArraySize(1), pearlArraySize(2) );

for i = 1:length(pearlSingleArray)
    rgb(1,:) = pearlSingleArray(1,i,:);
    
    if( background == "white")
        Img = ones(rowDist, colDist, 3);
        color = 1;
        if( mode == "balanced")
            rgb = rgb * (1 - (0.5*(1 - meanImColor)));
        end
    elseif ( background == "black")
        Img = zeros(rowDist, colDist, 3);
        color = 0;
        if( mode == "balanced")
            rgb = rgb * (1 + (0.5*(0.5 - meanImColor)));
        end
    elseif ( background == "gray" )
        Img = ones(rowDist, colDist, 3)/2;
        color = 0.5;
    else
        Img = ones(rowDist, colDist, 3);
        Img(:,:,1) = Img(:,:,1) * meanImColorRGB(1);
        Img(:,:,2) = Img(:,:,2) * meanImColorRGB(2);
        Img(:,:,3) = Img(:,:,3) * meanImColorRGB(3);
        color = meanImColorRGB;
    end
        
    Center = [floor(colDist/2) floor(rowDist/2)];
    
    pearl = addPearl(Img, Center, colDist, rgb, color, whichBackground);
    
    pearlCell{1,i} = pearl;
end



end

