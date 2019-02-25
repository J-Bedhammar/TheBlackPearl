function pearls = drawCircles(PearlsPerCol, PearlsPerRow, indexMatrix, pearlCollection)

pearls = [];
pearlRow = [];

counterx = 1;
countery = 1;

for c = 1:PearlsPerRow
    for r = 1:PearlsPerCol
        pearl = pearlCollection{indexMatrix(r,c)};
        pearlRow = cat(1,pearlRow,pearl);
        
    end
    pearls = cat(2,pearls,pearlRow);
    
    pearlRow = [];
end

end

