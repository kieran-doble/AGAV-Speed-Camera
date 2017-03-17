function [boundingBox, distance] = imageDetection(filename)
% reads
image = imread(filename);

% get the height and width for later on
[imageHeight, imageWidth] = size(image);

% convert to hsv
image = rgb2hsv(image);
image = rgb2gray(image); % hue lets us find the cars

% convert to bw
image = im2bw(image, 0.3);
image = imfill(image, 'holes');
image = imerode(image, strel('square', 20));  % erode
image = imdilate(image, strel('square', 50)); % dilate

% calculate parameters from the image
stats = regionprops(image, 'ConvexArea', 'BoundingBox', 'Centroid');
boundingBox = stats.BoundingBox;
centroid = stats.Centroid;

carX = boundingBox(1);
carY = boundingBox(1);
  
width = boundingBox(2);
height = boundingBox(3);

carMiddleX = centroid(:, 1);
carMiddleY = centroid(:, 2);
distance = imageHeight - carMiddleY;

figure, imshow(image); hold on
rectangle('Position', boundingBox, 'EdgeColor', 'blue');
for x = 1: numel(stats)
plot(stats(x).Centroid(1),stats(x).Centroid(2),'ro');
end

end
