% Open image
A = ReadImage6D('.czi');
metadata = A{2};
image6d = A{1}; 

Image = image6d(1,1,1,1,:,:);
Image = squeeze(Image);
Image = mat2gray(Image,[0,65536]);

%Show Image
figure;
imshow(Image,'Border','tight')

%% Threshold image
T =  0.25;
BW = imbinarize(Image2,T);
figure;
imshow(BW)

%% Clean border

BW2 = imclearborder(BW);
figure;
imshow(BW2)

%% Clean extraneous pixels

BW3 = bwareaopen(BW2,200);
figure;
imshow(BW3)

%% Label each blob

labeledImage = bwlabel(BW3, 8);     % Label each blob so we can make measurements of it
% labeledImage is an integer-valued image where all pixels in the blobs have values of 1, or 2, or 3, or ... etc.
figure;
imshow(labeledImage, []);  % Show the gray scale image.

% Let's assign each blob a different color to visually show the user the distinct blobs.
coloredLabels = label2rgb (labeledImage, 'hsv', 'k', 'shuffle'); % pseudo random color labels
% coloredLabels is an RGB image.  We could have applied a colormap instead (but only with R2014b and later)
figure;
imshow(coloredLabels);

%% Measure size of each blob

blobMeasurements = regionprops(labeledImage, Image2, 'all');
numberOfBlobs = size(blobMeasurements, 1);


for k = 1 : numberOfBlobs           % Loop through all blobs.
	
	blobArea(k) = blobMeasurements(k).Area;		% Get area.
	
end

%% Record average area

Area = blobArea';