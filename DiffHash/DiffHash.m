function [hash] = DiffHash(pic)
%DiffHash Calculate a has for a picture by comparing value fo cell with
%value to the column to its right, if value is greater than one on the
%right return a 1 if value is less than value to the right return a 0
%   Input:
%       pic: a m-by-(n+1) uint8 array representing the greyscale image
%   Output:
%       hash: a 1-by-mn logical row vector representing the differential
%       hash of the greyscale image
%Author: Shazeel Ali Sali153

%% Difference Comparison
pic = double(pic);
[rows,cols,~] = size(pic);
hash_array = zeros(rows,cols-1);
for i=1:rows
    for j=1:cols-1
        hash_array(i,j) =  (pic(i,j) >= pic(i,j+1));
    end
end

%% Resize array from m-by-n to mn
hash = hash_array';
hash = hash(:);
hash=logical(hash');
end