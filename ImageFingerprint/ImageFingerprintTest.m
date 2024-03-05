% hash = ImageFingerprint(imread("TestPictures\watch.png"),"DiffHash","ResizeBox");
% DispFP(hash);
% pic = GreyscaleLuma(imread("TestPictures\watch.png"));
% pic = ResizeBox(pic,[8,9]);
% hash = DiffHash(pic);
% DispFP(hash);

% hash = ImageFingerprint(imread("TestPictures\watch.png"),"DiffHash","Nearest");
% DispFP(hash);
% pic = GreyscaleLuma(imread("TestPictures\watch.png"));
% pic = ResizeNearest(pic,[8,9]);
% hash = DiffHash(pic);
% DispFP(hash);

% hash = ImageFingerprint(imread("TestPictures\watch.png"),"AvgHash","Nearest");
% DispFP(hash);
% pic = GreyscaleLuma(imread("TestPictures\watch.png"));
% pic = ResizeNearest(pic,[8,8]);
% hash = AvgHash(pic);
% DispFP(hash);

hash = ImageFingerprint(imread("TestPictures\watch.png"),'AvgHash','Box');
DispFP(hash);
pic = GreyscaleLuma(imread("TestPictures\watch.png"));
pic = ResizeBox(pic,[8,8]);
hash = AvgHash(pic);
DispFP(hash);