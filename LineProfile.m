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

%% Draw 10 profiles

c = improfile
d = improfile
e = improfile
f = improfile
g = improfile
h = improfile
i = improfile
j = improfile
k = improfile
l = improfile

%% Resize profiles 

one = imresize(c,[100/56]);
two = imresize(d,[100/52]);
three = imresize(e,[100/49]);
four = imresize(f,[100/76]);
five = imresize(g,[100/73]);
six = imresize(h,[100/51]);
seven = imresize(i,[100/81]);
eight = imresize(j,[100/54]);
nine = imresize(k,[100/58]);
ten = imresize(l,[100/63]);

%% Calculate average
av = [one(:,1) two(:,1) three(:,1) four(:,1) five(:,1) six(:,1) seven(:,1) ];
MN = mean(av,2);

%% Plot data

x = linspace(-1.3,1.3,100);

figure;
hold on
plot(x,one,'k')
plot(x,two,'k')
plot(x,three,'k')
plot(x,four,'k')
plot(x,five,'k')
plot(x,six,'k')
plot(x,seven,'k')
plot(x,eight,'k')
plot(x,nine,'k')
plot(x,ten,'k')
xlim([-1.3 1.3])
ylim([0 1])

figure;
plot(x,MN,'k')
