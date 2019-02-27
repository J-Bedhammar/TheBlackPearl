function [ quality ] = qualityScieLab( im, pearled, resolution, inches, d )
% QUALITYSCIELAB 
% SamplePerDegree = ppi? d ? tan(? /180)
% ppi = pixels/inch
% d = distance
% tan(pi/180) = angle
% Lab3: SPD =  1920/20.8661417 * 20 * tan(pi/180);

% Images rgb to xyz
original = rgb2xyz(im);
reproduction = rgb2xyz(pearled);

% Sample Per Degree
ppi = resolution/inches;
SPD = ppi * d * tan(pi/180);

% Light
whitePoint = [95.05, 100, 108.9];  % CIED65

% S-CieLab
quality = mean(mean(scielab(SPD, original, reproduction, whitePoint, 'xyz')));


end

