filenames = ["TestPictures/Duck1.jpg"; "TestPictures/Duck2.jpg"; "TestPictures/Rosie.jpg"; "TestPictures/RosieWithBall.jpg"];
fp_collection = FingerprintCollection(filenames, 'DiffHash', 'Box');
deck_rosie = imread("TestPictures/DeckRosie.jpg");
deck_rosie_fp = ImageFingerprint(deck_rosie, 'DiffHash', 'Box');
RankSimilarity(deck_rosie_fp, filenames, fp_collection, 4);
% for i=1:length(fp_collection)
%     DispFP(fp_collection{i});
% end

% filenames = ["RosieWithBall.jpg";"Duck1.jpg"; "Duck2.jpg"; "Rosie.jpg"; "Balloons1.jpg"; "Balloons2.jpg"; "Basket1.jpg"; "Basket2.jpg"; "Hat1.jpg";"Hat2.jpg";"Ruins1.jpg"; ];
% test = logical([1 0 1 1 1 1 1 0 1 1 1 0 0 0 0 0 1 1 0 1 1 0 0 0 1 1 0 1 0 0 0 0 1 1 1 0 0 0 1 1  1 1 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 1 1 1 0 1 0 1]);
% fp_collection = {test;test;test;test;test;test;test;test;test;test;test};
% deck_rosie_fp = test;
% RankSimilarity(deck_rosie_fp, filenames, fp_collection, 11);

% filenames = ["Duck1.jpg"; "Duck2.jpg"; "Rosie.jpg"];
% fp_collection = {[1 1 1 0], [1 1 0 0], [1 0 0 0]};
% main_fingerprint = [1 1 1 1];
% RankSimilarity(main_fingerprint, filenames, fp_collection, 3);