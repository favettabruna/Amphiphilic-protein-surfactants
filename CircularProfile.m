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

%% Manually create a circle
h = images.roi.Circle(gca,'Center',[343 275.5],'Radius',24.5);

% Create a mask out of it
mask = createMask(h);

% Find boudnaries
boundaries = bwboundaries(mask);
numberOfBoundaries = size(boundaries, 1);
thisBoundary = boundaries{1};
x = thisBoundary(:,2);
y = thisBoundary(:,1);

%Plot over orginal image
plot(x, y, '--w', 'LineWidth', 2);
hold off;

% Extract all pixels along this profile
for k = 1 : length(x)
  profile(k) = Image(y(k), x(k));
end

% Plot circular profile
figure;
plot(profile);
grid on;
title('Profile');
xlabel('Distance');
ylabel('Gray Level');

% Calculate total 
TotalIntensity = sum(profile);

%% Smooth out profile

% Use Anisotropic Dif Filter denoise while keeping edges
num_iter = 30;
delta_t = 1/7;
kappa = 5;
option = 2;
NewImage = anisodiff2D(Image,num_iter,delta_t,kappa,option);

%Show new image
figure;
imshow(NewImage)
title('Anis Dif Filtered Image')

% extract all pixels along this profile
for k = 1 : length(x)
  profile2(k) = NewImage(y(k), x(k));
end

% Plot Circular Profile
figure;
plot(profile2);
grid on;
title('Profile2');
xlabel('Distance');
ylabel('Gray Level');

%Calculate total
TotalIntensity = sum(profile2);

