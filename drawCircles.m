function pearls = drawCircles(img, ColDist, RowDist, indexMatrix, pearlSingleArray)

[height, width, dim] = size(img);
[m, n] = size(indexMatrix);

pearls = zeros(size(img));

counterx = 1;
countery = 1;


for c = 1:ColDist:width
    for r = 1:RowDist:height
        if(c == width || r == height || counterx > m || countery > n)
            continue
        end
        
        rgb(1,1) = pearlSingleArray(1,indexMatrix(counterx,countery),1);
        rgb(1,2) = pearlSingleArray(1,indexMatrix(counterx,countery),2);
        rgb(1,3) = pearlSingleArray(1,indexMatrix(counterx,countery),3);
        
        Center = [c + floor(ColDist/2), r + floor(RowDist/2)];
        pearls = addPearl(pearls, Center, ColDist, rgb);
        
        counterx = counterx + 1;
    end
    countery = countery + 1;
    counterx = 1;
end

end

