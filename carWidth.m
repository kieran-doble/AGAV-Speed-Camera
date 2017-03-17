function width = carWidth(carDistance, boundingBox)
carX = boundingBox(1);
width = boundingBox(3);

leftOfCarWidth = abs((480 / 2) - carX);
rightOfCarWidth = abs((480 / 2) - (carX + width));

leftOfCarWidthAngle = leftOfCarWidth * 0.042;
rightOfCarWidthAngle = rightOfCarWidth * 0.042;

leftCarWidth = sqrt(carDistance.^2 + 7.^2) * tand(leftOfCarWidthAngle);
rightCarWidth = sqrt(carDistance.^2 + 7.^2) * tand(rightOfCarWidthAngle);

width = leftCarWidth + rightCarWidth;
end
