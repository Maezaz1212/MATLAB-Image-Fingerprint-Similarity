% grey_pic = GreyscaleLuma(imread("TestPictures\watch.png"));
% resized_pic = ResizeBox(grey_pic,[8,9]);
% imwrite(resized_pic,"watch_resized_8x9.png")

% img =[57    88     1;
%    170   199   154;
%    216   172    99]
% 
% resized = ResizeBox(uint8(img),[2,2])

resized_pic = ResizeBox(imread("TestPictures\watch.png"),[8,8])