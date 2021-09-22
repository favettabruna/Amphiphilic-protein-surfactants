%Upload image
A = ReadImage6D('.czi');
metadata = A{2};
image6d = A{1};

%Create grayscale image
Image = image6d(1,1,1,1,:,:);
Image = squeeze(Image);
Image = mat2gray(Image,[0,65536]);

% Show Image
figure;
imshow(Image,'Border','tight')

%% Threshold the image to keep circles
T =  0.12;
NewImage = imbinarize(Image,T);
NewImage = im2double(NewImage);
NewImage2 = bwareaopen(NewImage,5);

% Show Image
figure;
imshow(NewImage2,'Border','tight')

[centers,radii] = imfindcircles(NewImage2,[10 30],'Sensitivity',0.89, 'ObjectPolarity','dark');
viscircles(centers,radii);

%% Make mask of circle regions

S = size(radii,1);
W = zeros(1024);

for i = 1:S
    circ = drawcircle('Center',centers(i,:),'Radius',radii(i,:)+9);
    BW = createMask(circ);
    W = W + BW;
    
end

figure;
imshow(W,'Border','tight')


%% Erase background


BI = zeros(1024);

for i = 1:1024
    for j = 1:1024
        if W(i,j) ~= 0
            BI(i,j) = Image(i,j);
        end
    end
end


figure;
imshow(BI,'Border','tight')

%% Find inner circle regions

T =  0.12;
NewImage = imbinarize(BI,T);
NewImage = im2double(NewImage);

%Show Image
figure;
imshow(NewImage,'Border','tight')

[centers2,radii2] = imfindcircles(NewImage2,[10 40],'Sensitivity',0.9, 'ObjectPolarity','dark');
viscircles(centers2,radii2);


%% Make mask of inner circles

S = size(radii2,1);
W2 = zeros(1024);

for i = 1:S
    circ = drawcircle('Center',centers2(i,:),'Radius',radii2(i,:)-1);
    BW = createMask(circ);
    W2 = W2 + BW;
    
end

figure;
imshow(W2,'Border','tight')

%% Eras inner circle background

for i = 1:1024
    for j = 1:1024
        if W2(i,j) == 1
            BI(i,j) = 0;
        end
    end
end

figure;
imshow(BI,'Border','tight')

%% Calculate average ring pixel value

Sum = 0;
Count = 0;

for i = 1:1024
    for j = 1:1024
        if BI(i,j) ~= 0
            Sum = Sum + Image(i,j);
            Count = Count + 1;
        end
    end
end

Average = Sum / Count;