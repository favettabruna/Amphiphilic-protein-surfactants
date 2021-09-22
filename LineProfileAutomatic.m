% Open image
A = ReadImage6D('.czi');
metadata = A{2};
image6d = A{1};

Image = image6d(1,1,1,1,:,:);
Image = squeeze(Image);
Image = mat2gray(Image,[0,65536]);

% Show image
figure;
imshow(Image,'Border','tight')

%% Find Circles
[centers,radii,metric] = imfindcircles(Image,[15 50],'Sensitivity',0.8);
viscircles(centers,radii);

%% Loop over all circles found and find the line profile across the middle

% Re-open fluorescent image
F = image6d(1,1,1,2,:,:);
F = squeeze(F);
F = mat2gray(F);

% Find all profiles
allcsB = {};
allcsS = {};
figure;
imshow(F,'Border','tight')
hold on

for i = 1:length(radii)
    x = [centers(i,1)-radii(i)-radii(i)./3 centers(i,1)+radii(i)+radii(i)./3];
    y = [centers(i,2) centers(i,2)];
    
    x2 = [centers(i,1) centers(i,1)];
    y2 = [centers(i,2)-radii(i)-radii(i)./3 centers(i,2)+radii(i)+radii(i)./3];
    
    if radii(i) > 2
        
        if radii(i) < 100
            c = improfile(F,x,y)';
            allcsS = [allcsS; c];

            plot(x,y,'r')

            c = improfile(F,x2,y2)';
            allcsS = [allcsS; c];

            plot(x2,y2,'b')
        
        end
        

    end
end

% Plot profile
profile = allcs{7,1}; % Change first number to number between 1:total number of circles
figure;
plot(profile)

% Find background

SE = ones(15,15);
ImageB = imdilate(Image2,SE);

B = (ImageB - 1)*-1;
B = B .* F;
figure;
imshow(B,'Border','tight')

averageB = mean(B, 'all');

%% Normalize y axis and plot all profiles

figure;
xlabel('Radial Location')
ylabel('Pixel Intensity')
title('Pixel Profile for Droplets')
hold on


for ii = 1:length(allcsS)
    
    allcsr(ii,:) = imresize(allcsS{ii},[1 30]);
    %allcsr(ii,:) = allcsr(ii,:)- averageB;
    %MaxP = max(allcsr(ii,:));
    
    plot(allcsr(ii,:))

end

%% Find and plot average profile

averageS = mean(allcsr(1:10,:),1);
figure;
plot(averageS)
ylim([0 1])
xlabel('Radial Location')
ylabel('Average Pixel Intensity')
title('Average Pixel Profile for Small Droplets (R < 30)')

%% Normalize to 1

Norm = (averageS - min(averageS))/(max(averageS)-min(averageS));
figure;
plot(Norm)
