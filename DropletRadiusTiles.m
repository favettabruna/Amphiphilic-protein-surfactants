%% Open image
A = ReadImage6D('.czi');
metadata = A{2};
image6d = A{1}; 

Image = image6d(1,1,1,1,:,:);
Image = squeeze(Image);
Image = mat2gray(Image,[0,65536]);

%Show Image
figure;
imshow(Image,'Border','tight')

%% Find circles

[centers,radii,~] = imfindcircles(Image,[5 40],'Sensitivity',0.85, 'ObjectPolarity','bright');
[centersNew,radiiNew]=RemoveOverLap(centers,radii,1,2);
viscircles(centersNew,radiiNew,'LineWidth',0.5);

[centers2,radii2,~] = imfindcircles(Image,[40],'Sensitivity',0.85, 'ObjectPolarity','dark');
[centersNew2,radiiNew2]=RemoveOverLap(centers2,radii2,1,2);
viscircles(centersNew2,radiiNew2,'Color','b','LineWidth',0.5);

circles = cat(1,radiiNew,radiiNew2);
midpts = cat(1,centersNew,centersNew2);
[centersNew3,radiiNew3]=RemoveOverLap(midpts,circles,1,2);

figure;
imshow(Image)
viscircles(centersNew3,radiiNew3,'Color','r','LineWidth',0.5);
