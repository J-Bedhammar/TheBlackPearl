function [pearlPlate,pearlSingleArray] = pearlColors(pearlSize, RGBRange)
%gets how big pearls should be in height and how many steps in each color 
if pearlSize < 1
    pearlSize = 1;
end

colorStepR = 1 / RGBRange(1);
colorStepG = 1 / RGBRange(2);
colorStepB = 1 / RGBRange(3);
pearlPlateSize = pearlSize *RGBRange(1)*RGBRange(2)*RGBRange(3);
colorArray = zeros(pearlSize,pearlPlateSize,3);
pearlSingleArray = zeros(1,(RGBRange(1)*RGBRange(2)*RGBRange(3)),3);
counter = 1;
lowerLimit = 1;
upperLimit = pearlSize;

for r = 1 : RGBRange(1)%:stepSizeL:rangeL%1:setpSizeL:rangeL
    for g = 1 : RGBRange(2)
        for b =   1 : RGBRange(3)
            pearlSingleArray(1,counter,1) = colorStepR*r;
            pearlSingleArray(1,counter,2) = colorStepG*g;
            pearlSingleArray(1,counter,3) = colorStepB*b;

            colorArray(:,lowerLimit:upperLimit,1) = colorStepR*r;
            colorArray(:,lowerLimit:upperLimit,2) = colorStepG*g;
            colorArray(:,lowerLimit:upperLimit,3) = colorStepB*b;
            lowerLimit = pearlSize*counter ;
            counter = counter+1;
            upperLimit = pearlSize*counter;
        end
    end
end

pearlPlate = colorArray;

end
