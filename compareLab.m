function index = compareLab(arrayLab,colorRGB)
% Author: Oliver Johansson
% Compares the picked color to the colorarray and picks the one that looks like the picked color the most.

colorLab = rgb2lab(colorRGB);

Smallest = 1000000;

c_L = colorLab(:,1);
c_A = colorLab(:,2);
c_B = colorLab(:,3);

for i = 1:length(arrayLab)
    a_L = arrayLab(1,i,1);
    a_A = arrayLab(1,i,2);
    a_B = arrayLab(1,i,3);
    
    E_ab = sqrt((c_L - a_L)^2 + (c_A - a_A)^2 + (c_B - a_B)^2);
    
    if(E_ab < Smallest)     
        Smallest = E_ab;
        index = i;   
    end   
end

end

