function [pearlifiedIm] = assemble(indexMatrix,ColDist,RowDist,imSize,pearlSingleArray)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

x = imSize(1);
y = imSize(2);
pearlifiedIm = zeros(x,y,3);

counterx = 1;
countery = 1; 
lastRow = 1;
lastCol = 1;

for r = 1:RowDist:x
    for c = 1 :ColDist:y
           pearlifiedIm(lastRow:RowDist*counterx,lastCol:ColDist*countery,1) = pearlSingleArray(1,indexMatrix(counterx,countery),1);
           pearlifiedIm(lastRow:RowDist*counterx,lastCol:ColDist*countery,2) = pearlSingleArray(1,indexMatrix(counterx,countery),2);
           pearlifiedIm(lastRow:RowDist*counterx,lastCol:ColDist*countery,3) = pearlSingleArray(1,indexMatrix(counterx,countery),3);
           % indexing and access stuff
           lastCol = ColDist*countery;
           countery = countery+1;
      
    end
    % indexing and access stuff
    % and reset y for each row
    countery = 1;
    lastCol = 1;
    lastRow = (RowDist*counterx) +1;
    counterx = counterx+1;
end


