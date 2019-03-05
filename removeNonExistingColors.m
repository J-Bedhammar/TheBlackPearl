function [RemovedNonExistingPearls,newIndexPearlGrid,limitedNumberOfPearls] = removeNonExistingColors(pearlSingleArray,indexPearlGrid,maxNumberOfColors)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
RemovedNonExistingPearls = zeros(1,maxNumberOfColors,3);
[x,y] = size(indexPearlGrid);
indexlist = zeros(1,maxNumberOfColors);
newIndexPearlGrid = zeros(x,y);
counter = 1;
for i = 1:x
    for j = 1:y
       index  = indexPearlGrid(i,j);
       if(~ismember(index,indexlist))
            indexlist(counter) = index;
            RemovedNonExistingPearls(1,counter,:) = pearlSingleArray(1,index,:);
            counter = counter+1;
       end
       f = find(indexlist == index);
       newIndexPearlGrid(i,j) = f;
       
    end
end

a = unique(newIndexPearlGrid);
out = [a,histc(newIndexPearlGrid(:),a)];
furtherRemoved = zeros(1,maxNumberOfColors);
limitedNumberOfPearls = zeros(1,maxNumberOfColors,3);
[outSizeX,outSizeY] = size(out);
if(outSizeX <maxNumberOfColors)
    loopend = outSizeX;
else
    loopend = maxNumberOfColors;
end

for i = 1: loopend
[value,maxIndex] = max(out(:,2));
furtherRemoved(i) = maxIndex(1);
limitedNumberOfPearls(1,i,:)=RemovedNonExistingPearls(1,maxIndex(1),:);
out(maxIndex(1),:) = [];
end




end

