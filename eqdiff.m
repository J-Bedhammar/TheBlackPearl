function [diffvector] = eqdiff(matrix1,inmatrix2,len)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


diffvector = zeros(1,len);
for i = 1 : len
matrix2  =inmatrix2(1,i,:); 
diffvector(i) = sqrt((matrix1(1,1,1)-matrix2(1,1,1)).^2 + (matrix1(1,1,2)-matrix2(1,1,2)).^2 +(matrix1(1,1,3)-matrix2(1,1,3)).^2); 
end

end
