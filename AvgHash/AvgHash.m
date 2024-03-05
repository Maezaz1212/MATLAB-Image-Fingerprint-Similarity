function [hash] = AvgHash(pic)
%AverageHash Creates a hash of a greyscale image using the average hash
%algorithm ( Compare each value to the average of the entire array, if
%value >= average, then add 1 to the array, if value < average then add 0
%to the output array
%
%   Input:
%       pic: uint8 m-by-n array corresponding to the greyscale image
%   Output:
%       hash: logical 1-by-mn array containing the hash.   
%
%Author: Shazeel Ali Sali153

%% Average Hash
pic = double(pic);
[rows,cols] = size(pic);
 
avg = round(sum(pic,"all")/(rows*cols));

above_or_below = pic>=avg;
%% Change The direction and size of the array above_or_below
above_or_below = above_or_below';
hash = above_or_below(:); % change m-by-n array to mn column-wise
hash=logical(hash');


end