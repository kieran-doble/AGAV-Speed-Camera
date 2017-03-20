function [boundingBox, carLocation] = imageDetection(filename)
% reads image of car for detection
carImage = imread(filename);

% Converts RGB colour map to hsv as this greatly intesensifies the red
% green and blue. https://uk.mathworks.com/help/matlab/ref/rgb2hsv.html
carHsv = rgb2hsv(carImage);

% Converts hsv colour map to binary image. (imbinarize) in 2017.
% https://uk.mathworks.com/help/images/ref/im2bw.html
carBinary = im2bw(carHsv, 0.2);

% Fills as many possible holes within the image (the sunroof).
% https://uk.mathworks.com/help/images/ref/imfill.html
carFill = imfill(carBinary, 'holes');

% Erodes small sections of the image to give one large detection area. (the
% car) http://uk.mathworks.com/help/images/ref/imerode.html
carFlat = strel('square', 30);
carErode = imerode(carFill, carFlat);

% Dilates binary image to improve boundy detection.
% https://uk.mathworks.com/help/images/ref/imdilate.html
carFlat2 = strel('square', 60);
carDilate = imdilate(carErode, carFlat2);

% returns the regionprops of boundingBox, meaning x,y,z can be returned
% along with the centroids.
stats = regionprops(carDilate, 'BoundingBox', 'Centroid');
boundingBox = stats.BoundingBox;
centroid = stats.Centroid;

carMiddle = centroid(1,2);
%Pixels in image start 0 from top left. Car middle is in pixels i.e.
%001.jpg pixel is 514.7. car middle subtracted from sensor height (640)
%returns the pixels from the bottom of the image to the car position
%allowing carspeed function to begin.
carLocation = 640 - carMiddle;

%{
figure('Name', 'Original Car'), imshow(carImage); hold on
figure('Name', 'hsv Car'), imshow(carHsv); hold on
figure('Name', 'Binary Car'), imshow(carBinary); hold on
figure('Name', 'Fill Car'), imshow(carFill); hold on
figure('Name', 'Erode Car'), imshow(carErode); hold on
figure('Name', 'Dilate Car'), imshow(carDilate); hold on
rectangle('Position', boundingBox, 'EdgeColor', 'yellow', 'Linewidth', 2);
for x = 1: numel(stats)
plot(stats(x).Centroid(1),stats(x).Centroid(2),'ro');
end
%}
end
