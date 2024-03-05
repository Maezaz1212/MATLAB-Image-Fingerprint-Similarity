function [] = DispFP(hash)
%DispFP Displays Fingerprint in a manner which shows 8 number segments
%then a space
%   Input: 
%       hash: 1-by-n column array that represents the fingerprint to be
%       printed
%   Output:
%       no variable output - Displays fingerpint in segments of 8
%       e.g 10010001 00011001 00000111 01100000 11100110 11111100 11000111
%
% Author: Shazeel Ali Sali153

text_to_display = "";
for i=1:length(hash)
    if ~mod(i-1,8) && i ~= 1
        text_to_display = text_to_display + " " + num2str(hash(i));
    else
        text_to_display = text_to_display + num2str(hash(i));
    end
end

fprintf(text_to_display+"\n")