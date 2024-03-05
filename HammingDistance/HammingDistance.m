function [hammingDistance] = HammingDistance(fp_one,fp_two)
%HammingDistance Calculates the hamming distance of two different fingerprints
% by comparing each bit, if the bits are different then hamming distance
% increases, the greater the hamming distance the more different the
% fingerprints
%   Input:
%       fp_one: 1-by-n row vector to correspond to the first fingerprint to
%       be compared
%       fp_two: 1-by-n row vector to correspond to the second fingerprint
%       to be compared
%
%   Outputs:
%       HammingDistance: The calculated hamming distance as a single
%       integer
%
% Author: Shazeel Ali Sali153

hammingDistance = 0;
for i=1:length(fp_one)
    if fp_one(i) ~= fp_two(i)
        hammingDistance = hammingDistance + 1;
    end
end

