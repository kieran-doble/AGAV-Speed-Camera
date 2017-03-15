function [distance, speedMPH] = calcSpeed(carPixelsFromBottomOfImageFirst, carPixelsFromBottomOfImageLast)
    degreesFromVertical = 90 - 30 - ((640 *0.042)/2); % 90 defines the FOV
    carViewAngleFromVerticalFirst = 30 + (carPixelsFromBottomOfImageFirst * 0.042);
    carViewAngleFromVerticalLast  = 30 + (carPixelsFromBottomOfImageLast * 0.042);
    
   
    distanceFirst = 7 * abs(tand(carViewAngleFromVerticalFirst));
    distanceLast = 7 * abs(tand(carViewAngleFromVerticalLast));

    changeInDistance = distanceLast - distanceFirst;
    display(changeInDistance);

    % v = d / t
    speedMetersPerSecond = changeInDistance / 0.1; % m/s
    display(speedMetersPerSecond)
    speedMPH = speedMetersPerSecond * 2.23694;
    display(speedMPH)
    
    distance = distanceFirst;
    
 
end