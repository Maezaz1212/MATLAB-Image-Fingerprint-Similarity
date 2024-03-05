function  RankSimilarity(img_fp, file_names, list_fp, n)
%RANKSIMILARITY displays image files ranked by descending similarity
%   RankSimilarity is the final function in this project which brings all
%   the other functions together to rank a number 'n' of image files by
%   descending similarity, using the image fingerprints.
%
% INPUTS
% img_fp: 1x64 logical row vector representing image fingerprint to search
% file_names: mx1 string array representing list of image file names
% list_fp: mx1 cell array containing a collection of image fingerprints
% n: integer denoting how many image fingerprint matches to display
%
% author: Aref Osman
% credit to: Elliot Varoy & Peter Bier for teaching the content so well and
%   Michael Zhang for the nicely formatted coursebook.

% get number of files
num_files = height(file_names);

% create cell array of unsorted fingerprints & hamming distances
fp_arr = cell(num_files, 3);

% create array of hamming distances
ham_values = zeros(num_files, 1);


% create cell array with hamming distances + filenames
for file = 1:num_files
    
    % get fingerprint
    fp = list_fp{file, 1};

    % calculate hamming distance
    ham_distance = HammingDistance(img_fp, fp);

    % add hamming distance to cell array
    fp_arr{file, 1}  = char(string(ham_distance(1, 1)));

    % add hamming distance to ham values array
    ham_values(file, 1) = double(string(ham_distance(1, 1)));
    
    % get file name
    file_name_arr = file_names(file, 1);
    file_name = char(file_name_arr(1, 1));

    % add file name to cell array
    fp_arr{file, 2}  = file_name;

    % add id to cell array to break ties
    fp_arr{file, 3}  = file;

end

disp(fp_arr);

% order fingerprints by hamming distance (similarity)
sorted_fp_arr = sortrows(fp_arr, [1 3]);

% find max hamming distance string length (for alignment purposes)
max_ham = max(ham_values);
max_ham_length = length(char(string(max_ham)));
% find max rank value string length (for alignment purposes)
max_rank_length = length(char(string(n)));


% display top 'n' similar fingerprint file names
for top_fp = 1:n
    
    % get rank number
    r = top_fp;
    % right align rank text
    r_text = [sprintf(sprintf('%%%id', max_rank_length), r)];

    % get hamming distance
    ham = double(string(sorted_fp_arr{top_fp, 1}));
    % right align hamming distance
    ham_text = [sprintf(sprintf('%%%id', 2), ham)];
    
    % get file name
    file_name_text = char(string(sorted_fp_arr{top_fp, 2}));
    
    % concatenate rank, hamming distance and file name appropriately
    full_rank_text = [r_text '. ' ham_text ' - ' file_name_text];

    % display rank line
    disp(full_rank_text);

end

end