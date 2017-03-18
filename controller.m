function [speedText, speed, size, width] = controller(image1, image2)
  [boundingBoxCar1, distance1] = imageDetection(image1);    
  [boundingBoxCar2, distance2] = imageDetection(image2);
  [distance1, speed, speedText] = carSpeed(distance1, distance2);
  [width, size] = carWidth(distance1, boundingBoxCar1);    
end
