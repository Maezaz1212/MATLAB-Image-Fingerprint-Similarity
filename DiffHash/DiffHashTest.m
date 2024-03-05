fp = DiffHash(imread("TestPictures\watch_resized_8x9.png"));
DispFP(fp)

fp = DiffHash(uint8([10 2 3; 11 1 2]));
DispFP(fp)