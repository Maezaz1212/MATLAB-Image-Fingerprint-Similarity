function [hash] = ImageFingerprint(pic,HashType,ResizeType)
%ImageFingerprint Creates image fingerprint given pic, hash typ and resize
%type
%   Input:
%       pic: a m-by-n-by-p uint8 array representing the image
%
%       HashType: Character array 'AvgHash' or 'DiffHash' corresponding to
%       the two hashing algorithms 
%
%       ResizeType: Character Array 'Box' or 'Nearest' Corresponding to the
%       two resizing algorithms box resizing and nearest resizing
%
%   Output:
%       hash: a 1-by-64 logical array containing the image fingerprint,
%       which depends on selected hash and resize type
%
%Author: Shazeel Ali Sali153

pic = GreyscaleLuma(pic);

%% Set size of image for hashing
if(strcmp(HashType,"AvgHash"))
    resize_size = [8,8];
else
    resize_size = [8,9];

end

%% Resize Picture depending on resize type
if(strcmp(ResizeType,"Nearest"))
    resized_pic = ResizeNearest(pic,resize_size);
else
    resized_pic = ResizeBox(pic,resize_size);
end

%% Hash Image depending on hashing type
if(strcmp(HashType,"AvgHash"))
    hash = AvgHash(resized_pic);
else
    hash = DiffHash(resized_pic);
end

end