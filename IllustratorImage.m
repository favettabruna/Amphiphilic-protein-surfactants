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

%% Pull time point and pixel to um conversion
data = bfopen('.czi');
omeMeta = data{1,4};

time = omeMeta.getPlaneDeltaT(0,1)
time1 = omeMeta.getPlaneDeltaT(0,3)
time2 = omeMeta.getPlaneDeltaT(0,5)
time3 = omeMeta.getPlaneDeltaT(0,7)
time4 = omeMeta.getPlaneDeltaT(0,10)
time5 = omeMeta.getPlaneDeltaT(0,5)
voxelSizeX = omeMeta.getPixelsPhysicalSizeX(0)% in μm

%% Regular image

Image2 = Image(100:100+274,1:1+274);
Image2 = mat2gray(Image2, [0 1]);
A = zeros(275);

Mask = zeros(275);
Mask(245:250,200:259)=1;

ImageS = Image2+Mask;

figure;
imshow(ImageS,'Border','tight')

%% Green image

Image2 = Image(1:1+274,1:1+274);
Image2 = mat2gray(Image2, [0 1]);

IRGB = repmat(Image2, [1,1,3]);
A = zeros(275);
R(:,:,1) = A; 
R(:,:,2) = Image2;
R(:,:,3) = A;

Mask = zeros(275);
Mask(245:250,200:259)=1;

Image4 = R + Mask;

figure;
imshow(Image4,'Border','tight')

%% red image

Image2 = Image(140:140+274,30:30+274);
Image2 = mat2gray(Image2, [0 .2]);

IRGB = repmat(Image2, [1,1,3]);
A = zeros(275);
C(:,:,1) = Image2; 
C(:,:,2) = A;
C(:,:,3) = A;

Mask = zeros(275);
Mask(245:250,200:259)=1;

Image3 = C + Mask;

M = Image3 .*3;

figure;
imshow(Image3,'Border','tight')

%% Merge images

c = Image3 + Image4;

figure;
imshow(c,'Border','tight')
