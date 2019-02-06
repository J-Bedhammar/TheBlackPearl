function [pearlColors] = pearlColors(numberOfColors,numberOfL)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
pearlSize = 5;
colorStepR = 1 / 4;
colorStepG = 1 / 5;
colorStepB = 1 / 5;
pearlPlateSize= pearlSize  *(5*5*4);
colorArray = zeros(pearlSize,pearlPlateSize,3);
counter = 1;
lowerLimit  = 1 ; 
upperLimit = pearlSize;

for r = 1 : 4%:stepSizeL:rangeL%1:setpSizeL:rangeL
    for g = 1 : 5
        for b =   1 : 5
                    
                colorArray(:,lowerLimit:upperLimit,1) = colorStepR*r;
                colorArray(:,lowerLimit:upperLimit,2) = colorStepG*g;
                colorArray(:,lowerLimit:upperLimit,3) = colorStepB*b;
                lowerLimit = pearlSize*counter ;
                counter = counter+1;
                upperLimit = pearlSize*counter;
        end
    end
end

pearlColors = colorArray;
