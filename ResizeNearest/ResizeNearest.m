function [resized] = ResizeNearest(picture,sizes)
%ResizeNearest Takes image and resizes it using the resize nearest algorithm. 
% ResizeNearest works by taking an rgb or greyscale image, then
% calculating p*q equally spaced points on that image corresponding to the
% pixels of the new image. It then takes the values of the image at these
% positions and creates a new image
%
%   Input:
%       picture: m-by-n-by-o uint8 img array corresonding to the image to
%       be resized
%       sizes: 1-by-2 array containing the new dimensions of the picture
%   Output:
%       Resized: p-by-q-by-o uint8 img array corresponding to the
%       resized image
%
% Author: Shazeel Ali Sali153

picture = double(picture);
[c_rows,c_columns,c_colours] = size(picture);

% Calculate ratios to figure out corresponding positions on the image
ratio_rows = c_rows/sizes(1);
ratio_columns = c_columns/sizes(2);

resized = zeros(sizes(1),sizes(2),c_colours);

for i=1:sizes(1)
    for j=1:sizes(2)
        
        %Figure out corresponding pixels of the old image
        rel_row = ceil((i-0.5) * ratio_rows);
        rel_col = ceil((j-0.5) * ratio_columns);

        resized(i,j,1:c_colours) = picture(rel_row,rel_col,1:c_colours);
    end
end

resized = uint8(resized);