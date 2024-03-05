function [greyscale] = GreyscaleLuma(picture)
%GreyscaleLuma Takes a colourful rgb picture and turns it to greyscale
%Turns to greyscale using the formula (0.2126*r) + (0.7152*g) + (0.0722*b)
%
%   Input:
%       picture: m-by-n-by-3 uint8 img array corresonding to the colour
%       image to be greyscaled
%   Output:
%       greyscale: m-by-n-by-1 uint8 img array corresponding to the
%       greyscale image
%
%Author: Shazeel Ali Sali153

picture = double(picture);

[rows,columns,~] = size(picture);
greyscale = zeros(rows,columns);

for i=1:rows
    for j=1:columns
        r = picture(i,j,1);
        g = picture(i,j,2);
        b = picture(i,j,3);
        greyscale(i,j) = (0.2126 * r) + (0.7152 * g) + (0.0722 * b);
    end
end

greyscale = uint8(greyscale);
end