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
padding  =ColDist/20;
for r = 1:RowDist:x
    for c = 1 :ColDist:y
       r1 = pearlSingleArray(1,indexMatrix(counterx,countery),1);
       g1 = pearlSingleArray(1,indexMatrix(counterx,countery),2);
       b1 = pearlSingleArray(1,indexMatrix(counterx,countery),3);
       circle = rectangle('Position',[(r+padding) (c+padding) (RowDist-2*padding) (ColDist - 2*padding)], "Curvature",[1 1] , "FaceColor", [r1,g1,b1],"EdgeColor",[r1,g1,b1]);
       
       %pearlifiedIm(lastRow:RowDist*counterx,lastCol:ColDist*countery,1) = r1;
       %pearlifiedIm(lastRow:RowDist*counterx,lastCol:ColDist*countery,2) = g1;
       %pearlifiedIm(lastRow:RowDist*counterx,lastCol:ColDist*countery,3) = b1;
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


