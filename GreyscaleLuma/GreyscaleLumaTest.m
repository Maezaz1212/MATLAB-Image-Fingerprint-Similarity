picture = GreyscaleLuma(imread("TestPictures\watch_resized_8x9.png"));
imshow(picture);
imwrite(picture,"watch_resized_8x9_greyscale.png")