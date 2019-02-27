function [pearlifiedIm] = assemble(indexMatrix,PearlsPerCol,PearlsPerRow,padding,pearlSingleArray,RowDist,ColDist)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

x = PearlsPerRow;
y = PearlsPerCol;
pearlifiedIm = zeros(x,y,3);

counterx = 1;
countery = 1; 
lastRow = 1;
lastCol = 1;
%padding = ColDist/20;

for c = y :-1:1 
    for r = 1:x
        
        r1 = pearlSingleArray(1,indexMatrix(counterx,countery),1);
        g1 = pearlSingleArray(1,indexMatrix(counterx,countery),2);
        b1 = pearlSingleArray(1,indexMatrix(counterx,countery),3);
        circle = rectangle('Position',[(r*RowDist+padding) (c*ColDist+padding) (RowDist-2*padding) (ColDist - 2*padding)], "Curvature",[1 1] , "FaceColor", [r1,g1,b1],"EdgeColor",[r1,g1,b1]);
        hole = rectangle('Position',[(r*RowDist + RowDist/3 +padding) (c*ColDist + ColDist/3 +padding) (RowDist- RowDist/1.5 - 2*padding) (ColDist - ColDist/1.5 - 2*padding)], "Curvature",[1 1] , "FaceColor", [1,1,1],"EdgeColor",[1,1,1]);
        pearlifiedIm(lastRow:RowDist*counterx,lastCol:ColDist*countery,:) = circle;
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

axis equal
axis off
set(gca,'position',[0 0 1 1],'units','normalized')

end
