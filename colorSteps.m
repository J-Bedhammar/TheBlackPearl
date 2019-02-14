function [ RGBRange ] = colorSteps(numberOfColors)
%NUMCOLORS Summary of this function goes here
% User chooses alternative 1-9, which decides number of pearl colors,
% ranging from 100 to 4 colors
R = 4;
G = 5;
B = 5;

switch numberOfColors
    case 1      % 100
        R = 5;
        G = 4;
        B = 5;
    case 2      % 80
        R = 4;
        G = 5;
        B = 4;
    case 3      % 64
        R = 4;
        G = 4;
        B = 4;
    case 4      % 48
        R = 4;
        G = 3;
        B = 4;
    case 5      % 27
        R = 3;
        G = 3;
        B = 3;
    case 6      % 18
        R = 3;
        G = 2;
        B = 3;
    case 7      % 12
        R = 2;
        G = 2;
        B = 3;
    case 8      % 8
        R = 2;
        G = 2;
        B = 2;
    otherwise      % 4
        R = 2;
        G = 1;
        B = 2;
end

RGBRange = [R, G, B];


end

