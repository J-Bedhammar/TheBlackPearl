function [meanGrid] = meanColorInGrid(im,ColDist,RowDist)

[x,y]=size(im(:,:,1));
meanGrid = zeros(x/RowDist,y/ColDist,3);
counterx = 1;
countery = 1; 
lastRow = 1;
lastCol =1;
for r = 1:RowDist:x
    for c = 1 : ColDist : y
        meanGrid(counterx,countery,1)=mean(mean(im(lastRow:RowDist,lastCol:ColDist,1)));
        meanGrid(counterx,countery,2)=mean(mean(im(lastRow:RowDist,lastCol:ColDist,2)));
        meanGrid(counterx,countery,3)=mean(mean(im(lastRow:RowDist,lastCol:ColDist,3)));
        
        countery = countery+1;
        lastCol  =ColDist;
    end
    countery = 1;
    counterx = counterx+1;
    lastRow = RowDist;
end

a = ("hej")
