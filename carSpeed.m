function [distance, speed] = carSpeed(carFirstImage, carFinalImage)
    imageHeight = 640;      %Defines the height of each image.
    cameraPosition = 7;     %Defines camera position (7 meters above road).
    sensorPixel = 0.042;    %Defines each sensor pixel in the view angle.
    cameraAngle = 30;       %Defines angle of camera off the horizontal horizon.
    imageInterval = 0.1;    %Defines Intervals between each image being taken.
    
    