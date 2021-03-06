function [size, width] = carWidth(distance1, boundingBox)
% Gets the X coords from the bounding box.
carXCoord = boundingBox(1);
% Gets the width from the bounding box.
carWidth = boundingBox(3);
% Gets the absolute value left side of the car in degrees
leftOfCarWidth = abs((480 / 2) - carXCoord) * 0.042;
% Gets the absolute value right side of the car in degrees
rightOfCarWidth = abs((480 / 2) - (carXCoord + carWidth)) * 0.042;
% Adds both sides to return total width in degrees.
widthdegrees = leftOfCarWidth + rightOfCarWidth;
% Finds the square root of the cars first position mutipled by the tangent
% of degrees of the width to return width in meters.
width = sqrt(distance1.^2) * tand(widthdegrees);

    if width > 2.5
      size = 'Too wide for tunnel.';
    else
      size = 'Clearence is acceptable.';
    end
end
