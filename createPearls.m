function [ pearlCell ] = createPearls(pearlSingleArray, colDist, rowDist)

pearlArraySize = size(pearlSingleArray);
pearlCell = cell( pearlArraySize(1), pearlArraySize(2) );

for i = 1:length(pearlSingleArray)
    rgb(1,:) = pearlSingleArray(1,i,:);
    Img = ones(rowDist, colDist, 3);
    Center = [floor(colDist/2) floor(rowDist/2)];
    
    pearl = addPearl(Img, Center, colDist, rgb);
    
    pearlCell{1,i} = pearl;
end



end

