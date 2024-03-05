function [collection] = FingerprintCollection(img_list,HashType,ResizeType)
%FingerprintCollection Creates a fingerprint for each inputted image
%   Input:
%       img_list: a m-by-1 list of strings that correspond to the filenames
%       of the images to find the fingerprint of
%
%       HashType: Character array 'AvgHash' or 'DiffHash' corresponding to
%       the two hashing algorithms 
%
%       ResizeType: Character Array 'Box' or 'Nearest' Corresponding to the
%       two resizing algorithms box resizing and nearest resizing
%
%   Output:
%       collection: a m-by-1 cell array in which each cell contains a
%       1-by-64 logical array corresponding to a image fingerprint.
%
%Author: Shazeel Ali Sali153

[img_list_size,~] = size(img_list);
collection = cell(img_list_size,1);

for i=1:img_list_size
    collection{i} = ImageFingerprint(imread(img_list(i)),HashType,ResizeType);
end

end