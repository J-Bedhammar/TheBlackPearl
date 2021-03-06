function [meanGrid] = meanColorInGrid(im,ColDist,RowDist)
% get grid mean values from og im. 

% size for length in x and y axis
[x,y]=size(im(:,:,1)); 
% grid that contains all means
meanGrid = zeros(floor(x/RowDist),floor(y/ColDist),3);
% for indexing and acces in im
counterx = 1;
countery = 1; 
lastRow = 1;
lastCol = 1;

for r = 1:RowDist:x
    for c = 1 : ColDist : y
        % goes through each grid area in the og im and creates a mean value
        % for that gridim. 
%         
        if(RowDist*counterx > x || ColDist*countery > y) 
            continue;
        end
       
        meanGrid(counterx,countery,1)=mean(mean(im(lastRow:RowDist*counterx,lastCol:ColDist*countery,1)));
        meanGrid(counterx,countery,2)=mean(mean(im(lastRow:RowDist*counterx,lastCol:ColDist*countery,2)));
        meanGrid(counterx,countery,3)=mean(mean(im(lastRow:RowDist*counterx,lastCol:ColDist*countery,3)));
        % indexing and access stuff
        
        
        lastCol = (ColDist*countery); 
        countery = countery+1;
        
    end
    % indexing and access stuff
    % and reset y for each row
    countery = 1;
    lastCol = 1;
    lastRow = (RowDist*counterx) +1;
    counterx = counterx+1;
    
    
end


end