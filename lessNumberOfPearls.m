function [newPearls] = lessNumberOfPearls(pearlSingleArray,numberOfWantedPearls)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[x,len,z] = size(pearlSingleArray);
labim  = rgb2lab(pearlSingleArray);

for i = 1 : length(pearlSingleArray)   
   diffToAll{i} = eqdiff(labim(1,i,:),labim(1,:,:),len);  
   diffToAll{i}(1,i,:) =0;
   
end

for i  = 1 : len
 sumDist(i) = abs(sum(diffToAll{i}));
end


for i = 1 : numberOfWantedPearls

  [val,idx(i)] = max(sumDist);
  newPearls(1,i,:) = pearlSingleArray(1,idx(i),:); 
  
   % remove for the next iteration the last smallest value:
   sumDist(idx(i)) = [];
  
end

    
end

