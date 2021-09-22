%Upload image
A = ReadImage6D('.czi');
metadata = A{2};
image6d = A{1}; 

%% Calculate min and max intensities
MinNum = 100000;
MaxNum = 0;

for time = 1:60

    for zstack = 1:1
        
        Image = image6d(1,time,zstack,1,:,:);
        Image = squeeze(Image);
        tempMin = min(min(Image));
        tempMax = max(max(Image));
        
        if tempMin < MinNum
            MinNum = tempMin;
        end
        
        if tempMax > MaxNum
            MaxNum = tempMax;
        end
    end
end

%% view

%Set parameter to be varied
idx = (1:60); % final number needs to be edited depending on size of image
img = image6d(1,idx,1,1,:,:);

% Convert to gray-scale 
Igray = mat2gray(img, [MinNum MaxNum]);

% Concatenate 9 gray-scale images into single 3D matrix 
B = squeeze(Igray);
B = permute(B,[2 3 1]);

% Show image
imshow3D(B)

%% Check

Image = image6d(1,110,4,1,:,:);
Image = squeeze(Image);

%Create RGB version
Image = mat2gray(Image, [MinNum MaxNum]);
Image = im2double(Image);

figure;
imshow(Image)

% Use Laplacian filter to enhance edges
Y = im2uint16(Image);
Image = imdiffusefilt(Y);

% Threshold the image to keep circles
T =  0.05;
NewImage = imbinarize(Image,T);
NewImage = im2double(NewImage);

figure;
imshow(NewImage)

%Count = Image.*NewImage;

%TP = sum(Count(:));


%% Find pixel intensity over ring in each image (across time lapse and z-stack)
TotalPixels = zeros(60,6);
TotalPixelsBig = zeros(60,6);

for time = 1:60

    for zstack = 10:19

        Image = image6d(1,time,zstack,1,:,:);
        Image = squeeze(Image);

        %Create RGB version
        Image = mat2gray(Image, [MinNum MaxNum]);
        Image2 = cat(3, Image, Image, Image);

        % Threshold the image to remove aggregates
        T = 1;
        binaryImage = imbinarize(Image,T);
        binaryImage2 = binaryImage-1;
        binaryImage3 = abs(binaryImage2);
        binaryImage4 = binaryImage3 .* Image2;

        % Use Laplacian filter to enhance edges
        Y = im2uint16(binaryImage4);
        Image = imdiffusefilt(Y);

        % Threshold the image to keep circles
        T =  0.11;
        NewImage = imbinarize(Image,T);
        NewImage = im2double(NewImage);

        %Get original pixel values
        FinalImage = NewImage .* binaryImage4;
        FinalImage2 = rgb2gray(FinalImage);
        %FinalImage3 = FinalImage2(100:165,220:285); %manually pick one ROI with one circle
        %TotalPixels(time,zstack) = sum(FinalImage3(:));
        TotalPixelsBig(time,zstack) = sum(FinalImage2(:));

    end
    
end

%%

figure;
imshow(binaryImage4,'Border','tight')

figure;
imshow(NewImage,'Border','tight')

figure;
imshow(FinalImage,'Border','tight')

%% Plot results

% Sum over the entire image
for ii = 1:60
    SumTB(ii) = sum(TotalPixelsBig(ii,:));
end

figure;
plot(SumTB,'-o','LineWidth',1,'MarkerSize',2)
title('Total Ring Intensity across image over time')
xlabel('Time')
ylabel('Pixel Intensity')


%% Sum just for one circle selected above
for ii = 1:60
    SumT(ii) = sum(TotalPixels(ii,:));
end

figure;
plot(SumT)
title('Total Ring Intensity in ROI over time')
xlabel('time')
ylabel('Pixel Intensity')
