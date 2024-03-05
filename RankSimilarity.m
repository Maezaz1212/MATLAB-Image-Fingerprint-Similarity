function [] = RankSimilarity(search_img,filenames,collection,display)
%RankSimilarity Ranks Similarity of search image to images in collection
%Using Image fingerprinting techniques we compare the search image
%fingerprint and the fingerprints in the collection using the hamming
%distance algorithm, lower hamming distance greateer the similarity
%
%   Input:
%       search_img: 1-by-64 logical array containting the fingerprint of
%       the search image
%
%       filenames: a m-by-1 list of strings that correspond to the filenames
%       of the images.
%
%       collection: a m-by-1 cell array containing all the fingerprints of
%       the images corresponding to filenames
%       
%       display: the length of ranking list to display
%
%   Output:
%       No variable output but displays n lines of highest ranking hamming
%       distances in form {rank_num}. {hamming_distance} - {filename} 
%       
%Author: Shazeel Ali Sali153 

addpath("AvgHash\","DiffHash\","DispFP\","FingerprintCollection\","GreyscaleLuma\","HammingDistance\","ImageFingerprint\","ResizeBox\","ResizeNearest\","TestPictures\")
%% Calculate hamming distances for all pictures
[list_length] = size(filenames);
hamming_distances = zeros(list_length);
for i=1:list_length
    hamming_distances(i) = HammingDistance(search_img,collection{i});
end

%% Sorts the hamming distance indices from highest hamming distance to
% lowest
ranked_list = [];
for i=0:64
    indices = find(hamming_distances == i);
    for j=1:length(indices)
        ranked_list = [ranked_list; indices(j)];
    end
end

%% Display ranking
display = round(display);
% Gets number of digits of display to format ranking column properly
ranking_number_format = length(num2str(display));
for i=1:display
    indice = ranked_list(i);
    % Right justify the ranking number depending on digits in display
    ranking_number_string = sprintf("%" + ranking_number_format +"d",i);
    hamming_distance_str = sprintf("%2d",hamming_distances(indice));
    fprintf(ranking_number_string + ". "+ hamming_distance_str + " - "...
            + filenames(indice) + "\n")
end

end
