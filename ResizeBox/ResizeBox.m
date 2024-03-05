function [resized] = ResizeBox(picture,sizes)
%ResizeBox Takes a image and resizes it using the resize Box algorithm,
% Takes a rgb or greyscale image and resizes it using the resize box
% algorithm. Cut up the larger image into p*q amount of even boxes, each box 
% corresponds to a pixel in the new image , then average the values in each
% box to find the new value of the correspondign image
%
%   Input:
%       picture: m-by-n-by-o uint8 img array corresonding to the image to
%       be resized
%       sizes: 1-by-2 array containing the new dimensions of the picture
%   Output:
%       Resized: p-by-q-by-o uint8 img array corresponding to the
%       resized image
%
%Author: Shazeel Ali Sali!53
picture = double(picture);
[c_rows,c_columns,c_colours] = size(picture);

ratio_rows = c_rows/sizes(1);
ratio_columns = c_columns/sizes(2);

resized = zeros(sizes(1),sizes(2),c_colours);

for i=1:sizes(1)
    for j=1:sizes(2)
        %% Pixel Tie Breaking
        %if half or more of the pixel is within the ranges it is included
        %in the resizing of this segment

        % if top most row includes >= 50% of the pixel then include it
        top_row = round(i*ratio_rows);
        
        % if bottom most row includes >= 50% of the pixel then include it
        if ((i-1)*ratio_rows)+1 - floor((i-1)*ratio_rows+1) > 0.5
            bot_row = ceil((i-1)*ratio_rows+1);
        else
            bot_row = floor((i-1)*ratio_rows+1);
        end

        % if right most column includes >= 50% of the pixel then include it
        right_most_column = round(j*ratio_columns);
        
        % if left most column includes >= 50% of the pixel then include it
        if ((j-1)*ratio_columns)+1 - floor(((j-1)*ratio_columns)+1) > 0.5
            left_most_column = ceil((j-1)*ratio_columns+1);
        else
            left_most_column = floor((j-1)*ratio_columns+1);
        end
         
        % Set box boundaries
        row_borders = bot_row:top_row;
        column_borders = left_most_column:right_most_column;
        
        % Average all values in the box for every colour value
        averages = zeros(1,c_colours);
        for k=1:c_colours
            colours_array = picture(row_borders,column_borders,k);
            sum_to_avg = sum(colours_array,"all");
            avg = sum_to_avg/(length(row_borders)*length(column_borders));
            averages(1,k) = avg;
        end

        resized(i,j,1:c_colours) = averages;
    end
end

resized = uint8(resized);
end