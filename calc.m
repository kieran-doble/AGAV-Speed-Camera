function [speedResult, speed, width, size] = calc(firstImage, secondImage)
  [boundingBoxFirst, distanceFirst] = imageDetection(firstImage);    
  [boundingBoxLast, distanceLast] = imageDetection(secondImage);
  [carDistance, speed] = carSpeed(distanceFirst, distanceLast);
  width = carWidth(carDistance, boundingBoxFirst);    
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
