function MImage = EllipticMask(FImage)
%EllipsMask Generate a mask for one eye and the complete face
%   Change pixel color for one eye and extract the face
%
%% Who has done it
%
% Author: jenbe027
% Co-author: thojo074
%
%% Syntax of the function
%
% Input arguments:  Fimage: Image containing a face 
%
% Output argument:  Mimage: Image with elliptical mask and a red eye
%
% You MUST NEVER change the first line
%
%% Basic version control (in case you need more than one attempt)
%
% Version: 1
% Date: today
%
% Gives a history of your submission to Lisam.
% Version and date for this function have to be updated before each
% submission to Lisam (in case you need more than one attempt)
%
%% General rules
%
% 1) Don't change the structure of the template by removing %% lines
%
% 2) Document what you are doing using comments
%
% 3) Before submitting make the code readable by using automatic indentation
%       ctrl-a / ctrl-i
%
% 4) In case a task requires that you have to submit more than one function
%       save every function in a single file and collect all of them in a
%       zip-archive and upload that to Lisam. NO RAR, NO GZ, ONLY ZIP!
%       All non-zip archives will be rejected automatically
%
% 5) Often you must do something else between the given commands in the
%       template
%
%

%% Your code starts here
%

%% create the output image (RGB!) which is a copy of the original image
% Use einstein.jpg as your FImage
% FImage is the IMAGE = numerical array and NOT THE FILENAME!
                    
FImage = imread('T3einstein.jpg');  % TA BORT

[sr,sc] = size(FImage);
MImage = FImage;

%% Generate the coordinates of the grid points
 [C R] = meshgrid((1:sc),(1:sr));
% Remember the matlab convention regarding rows, columns, x and y coordinates. Feel free to use 
% [Y,X] = meshgrid((1:sx),(1:sy)) or whatever notation instead if you feel more comfortable with that notation



%% Pick three points that define the elliptical mask of the face
% Read more about ellipses at https://en.wikipedia.org/wiki/Ellipse
% Your solution must at least be able to solve the problem for the case 
% where the axes of the ellipse are parallel to the coordinate axes
%

imshow(MImage);
fpts = round(ginput(3));

X = fpts(1,1);              % Center x
Y = fpts(1,2);              % Center y
a = fpts(1,1)-fpts(3,1);    % X length/2
b = fpts(1,2)-fpts(2,2);    % Y length/2

% ellipse equation
ellipse = ((C-X)/a).^2 + ((R-Y)/b).^2; 


%% Generate the elliptical mask and 
% set all points in MImage outside the mask to black 
...
threshold = ellipse(Y,X+a);

fmask =  ellipse <= threshold; % this is the mask use C and R to generate it
MImage(~fmask) = 0; % here you modify the image using fmask

%% Pick two points defining one eye, generate the eyemask, paint it red
imshow(MImage);
epts = round(ginput(2));

cx = epts(1,1);
cy = epts(1,2);
s = abs(cx - epts(2,1));
t = abs(cy - epts(2,2));

r =sqrt(s^2 + t^2);

circle = ((C-cx)/r).^2 + ((R-cy)/r).^2; 

threshold = circle(cy+s,cx+t);

R1 = MImage;
G2 = MImage;
B3 = MImage;

emask = circle <= threshold;    % circular eye mask again, use C and R
R1(emask) = 255;                 % replace eye points with red pixels
G2(emask) = 0;
B3(emask) = 0;
MImage = cat(3, R1, G2, B3);

%% Display result if you want
%
imshow(MImage);

end

