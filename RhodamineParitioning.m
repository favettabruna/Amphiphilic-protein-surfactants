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

%% Mask total R area

Y = im2uint16(Image);
I2 = imdiffusefilt(Y);

I3 = imbinarize(I2,.2);
figure;
imshow(I3)

%% Mask total GST area

% Create grayscale image
Image2 = image6d(1,1,1,1,:,:);
Image2 = mat2gray(Image2);
Image2 = squeeze(Image2);

%Show Image
figure;
imshow(Image2,'Border','tight')

Y2 = im2uint16(Image2);
I4 = imdiffusefilt(Y2);

%% Threshold image

I5 = imbinarize(I4,0.3);
figure;
imshow(I5)

%% Mask for just RGG-RGG

R = I3 - I5;
figure;
imshow(R)

%% Calc values
Rval = R.*Image;
figure;
imshow(Rval)

Gval = I5.*Image;
figure;
imshow(Gval)

%% Calc average
sum = 0;
count = 0;

for i = 1:550
    for k = 1:550
        if B(i,k) > 0
            sum = sum + B(i,k);
            count = count + 1;
        end
    end
end

        
sum
count
average = sum / count

%% background

B = Image - I3;
figure;
imshow(B)


%% Surfactant background

SI = Image(300:400,200:300);
figure;
imshow(SI)

Mean = mean(SI(:))