function [distance1, speedMPH, speedtext] = carSpeed(image1, image2)
% 90 degrees = vertical, subtract the camera angle and the degrees in the
% senor /2 to find centre. https://www.youtube.com/watch?v=qE3-4ZfMCZQ Was used to help
% understand trig and then PPD.
degreesFromVertical = 90 - 30 - ((640 *0.042)/2);

% Users above result to find the location of the centroid in each image in
% degrees.
carViewAngle1 = degreesFromVertical + (image1 * 0.042);
carViewAngle2  = degreesFromVertical + (image2 * 0.042);

% Calculates the horizontal distance between the objects and the camera.
distance1 = 7 * tand(carViewAngle1);
distance2 = 7 * tand(carViewAngle2);

% calculates the change in distance by subtracting the first number from
% the second.
cardistance = distance2 - distance1;

% calculates the images being take at 0.1s intervals and returns the
% value in meters per second.
speedMetersPerSecond = cardistance * 10;

% Converts meters per second in to miles per hour. 
speedMPH = speedMetersPerSecond * 2.236936;
speedMPH = round(speedMPH);

    if speedMPH > 30
      speedtext = 'Car is speeding.';
    else
        speedtext = 'Car is not speeding.';
    end 
  
end
