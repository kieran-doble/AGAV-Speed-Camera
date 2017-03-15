function [speedResult, speed, width, size] = calc(firstImage, secondImage)
    [boundingBoxFirst, distanceFirst] = process(firstImage);    
    [boundingBoxLast, distanceLast] = process(secondImage);

   [carDistance, speed] = calcSpeed(distanceFirst, distanceLast);
    width = calcWidth(carDistance, boundingBoxFirst);
    
    if speed > 30
        speedResult = 'Car speeding!';
    else
        speedResult = 'Below speed limit';
    end
    
    if width > 2.5
       size = 'Oversized';
    else
       size = 'Normal size';
    end
    
end