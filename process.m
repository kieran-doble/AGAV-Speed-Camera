function [boundingBox, distance] = process(filename)
    image = imread(filename);

    % get the height and width for later on
    [imageHeight, imageWidth] = size(image);

   
    % convert to hsv
    image = rgb2hsv(image);
    
    image = rgb2gray(image); % hue lets us find the cars
    
    % convert to bw
    image = im2bw(image, 0.3);
    
    
    regionsInfo = bwconncomp(image, 4); % 4 connected components
    regionsAmount = regionsInfo.NumObjects;
    
    % if there is only one region we dont need to remove smaller regions
    
    if (regionsAmount > 1)
        % get rid of small regions
        image = imerode(image, strel('square', 20));  % erode
        image = imdilate(image, strel('square', 50)); % dilate
    end

    [L, ~] = bwlabel(image, 4); % detect shapes
    
    % calculate parameters from L
    stats = regionprops(L, 'ConvexArea', 'BoundingBox', 'Centroid');
    boundingBox = stats.BoundingBox;
    centroid = stats.Centroid;
    

    carX = boundingBox(1);
    carY = boundingBox(2);
    
    width = boundingBox(3);
    height = boundingBox(4);
    
    carMiddleX = centroid(:, 1);
    carMiddleY = centroid(:, 2);

    distance = imageHeight - carMiddleY;
end
