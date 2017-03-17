function [distance, speedMPH] = carSpeed(firstImage, lastImage)
% 90 degrees = vertical, subtract the camera angle and the pixels per
% degree.
degreesFromVertical = 90 - 30 - ((640 *0.042)/2);

% take above and add degree of where the pixel is.
carViewAngleFromVerticalFirst = degreesFromVertical + (firstImage * 0.042);
carViewAngleFromVerticalLast  = degreesFromVertical + (lastImage * 0.042);

% Calculates the horizontal distance between the object and the camera.
distanceFirst = 7 * tand(carViewAngleFromVerticalFirst);
distanceLast = 7 * tand(carViewAngleFromVerticalLast);

% calculates the change in distance by subtracting the first number from
% the second.
changeInDistance = distanceLast - distanceFirst;

% calculates the images being take at 0.1s intervals and returns the
% value in meters per second.
speedMetersPerSecond = changeInDistance * 10;

% Converts meters per second in to miles per hour. 2.236936
speedMPH = speedMetersPerSecond * 2.24;
speedMPH = round(speedMPH);

% Passes the first distance for use in width.
distance = distanceFirst;
end
